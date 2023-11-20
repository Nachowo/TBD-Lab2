<template>
  <v-layout class="rounded rounded-md">
    <Header />
    <v-main>
      <div class="centered-layout">
        <div class="centered-message">
          <h2 class="sub-titulo">Crear Nueva Emergencia</h2>

          <div class="content">
            <v-card
              class="mx-auto pa-12 pb-8"
              elevation="4"
              max-width="500"
              rounded="lg"
              style="margin-top: 20px"
            >
              <div class="text-subtitle-1 text-medium-emphasis">
                Nombre de la emergencia
              </div>
              <v-text-field
                v-model="nombreEmergencia"
                type="text"
              ></v-text-field>

              <div class="text-subtitle-1 text-medium-emphasis">Ubicación</div>
              <v-text-field
                v-model="ubicacion"
                type="text"
                step="any"
              ></v-text-field>

              <v-btn
                class="mb-8"
                color="green"
                size="large"
                variant="tonal"
                @click="crearEmergencia"
              >
                CREAR EMERGENCIA
              </v-btn>
              <router-link to="/vistaInstitucion">
                <v-btn class="mb-8" color="blue" size="large" variant="tonal">
                  VOLVER AL INICIO
                </v-btn>
              </router-link>
            </v-card>
          </div>
        </div>
      </div>
    </v-main>
  </v-layout>
</template>

<script>
import axios from "axios";
import Header from "../components/HeaderInstitucion.vue";

export default {
  components: {
    Header,
  },
  data() {
    return {
      nombreEmergencia: "",
      ubicacion: "",
      latitud: "",
      longitud: "",
    };
  },
  methods: {
    async crearEmergencia() {
      try {
        const response = await fetch(
          `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(
            this.ubicacion
          )}.json?access_token=pk.eyJ1IjoibmFjaG93byIsImEiOiJjbHAyeTVmamMwM2o0MmpzMWN1OTV3eWt1In0.M8r291Kj6H18Wp80JkRx4g`
        );

        const data = await response.json();

        const location = data.features[0].center;
        this.latitud = location[1];
        this.longitud = location[0];
        const institucionS = localStorage.getItem("institucion");

        const institucion = JSON.parse(institucionS);

        const response2 = await axios.post(
          "http://localhost:8090/emergencia/crearEmergencia",
          {
            nombreEmergencia: this.nombreEmergencia,
            idInstitucion: institucion.idInstitucion,
            latitud: this.latitud,
            longitud: this.longitud,
          }
        );
        if (response2.status === 200) {
          this.$swal({
            icon: "success",
            title: "Éxito",
            text: "Emergencia creada exitosamente",
          }).then(() => {
            this.$router.push("/vistaInstitucion");
          });
        } else {
          this.$swal({
            icon: "error",
            title: "Error",
            text: "Error al crear la emergencia",
          });
        }
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

<style scoped>
.centered-layout {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.centered-message {
  text-align: center;
  padding: 20px;
}

.sub-titulo {
  border: 2px solid #a5a4a4;
  border-radius: 10px;
  padding: 15px;
  text-align: center;
  margin: 20px;
}

.text-subtitle-1 {
  margin-bottom: 8px;
  font-size: 16px;
}

.text-medium-emphasis {
  color: #333;
  font-weight: bold;
}

.v-card {
  margin: 20px;
}

.v-text-field {
  width: 100%;
  margin-bottom: 20px;
}
</style>
