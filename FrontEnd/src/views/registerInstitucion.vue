<script>
import axios from "axios";

export default {
  name: "register",
  data() {
    return {
      correoInstitucion:"",
      nombre:"",
      password: "",
      error: "",
    };
  },
  methods: {
    async registrar() {
      try {
        const response = await axios({
          method: "POST",
          url: "http://localhost:8090/institucion/register",
          data: {
            correoInstitucion: this.correoInstitucion,
            contraseniaVoluntario: this.password,
            nombreInstitucion: this.nombre,
          },
        });

        if (response.status === 200) {
          this.$swal({
              icon: 'success',
              title: 'Éxito',
              text: 'Su perfil de Institución se creó exitosamente',
          }).then(() => {
              this.$router.push('/loginInstitucion'); 
          });
        }
      } catch (error) {
        this.$swal({
          icon: "error",
          title: "Error",
          text: "Error al registrar la institución: " + error.response.data 
        });
      }
    },
  },
};
</script>

<template>
  <h3 style="text-align: center; margin-top: 40px;">
        CREAR CUENTA INSTITUCIÓN
      </h3>
  <div>
    <v-card
      class="mx-auto pa-12 pb-8"
      elevation="15"
      max-width="500"
      rounded="lg"
      style="margin-top: 40px"
    >
      <div class="text-subtitle-1 text-medium-emphasis">Ingrese los datos:</div>
      <v-responsive class="mx-auto" max-width="400">
        <v-text-field
          label="Email institución"
          placeholder="Introduzca su email de institución"
          type="input"
          v-model="correoInstitucion"
        ></v-text-field>
      </v-responsive>

      <v-responsive class="mx-auto" max-width="400">
        <v-text-field
          label="Contraseña"
          placeholder="Introduzca su contraseña"
          type="password"
          v-model="password"
        ></v-text-field>
      </v-responsive>

      <v-responsive class="mx-auto" max-width="400">
        <v-text-field
          label="Nombre"
          placeholder="Nombre de la institución"
          type="input"
          v-model="nombre"
        ></v-text-field>
      </v-responsive>

      <v-btn
        block
        class="mb-8"
        color="green"
        size="large"
        variant="tonal"
        @click="registrar"
      >
        Registrarse
      </v-btn>

      <v-card-text class="text-center">
        <a
          class="text-blue text-decoration-none"
          href="#"
          rel="noopener noreferrer"
          target="_blank"
        >
        </a>
      </v-card-text>
    </v-card>
  </div>
</template>

<style scoped>
body {
  background-color: #424953;
  display: flex;
  justify-content: center;
  align-items: center;
}

.log-in {
  color: #00a499;
}

body {
  height: 100vh;
}

#flexbox {
  display: flex;
}

#divImagen {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
