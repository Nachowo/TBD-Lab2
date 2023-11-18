<template>
  <v-layout class="rounded rounded-md">
    <Header />
    <v-main>
      <div class="centered-layout">
        <div class="centered-message">
          <h2 class="sub-titulo">Datos de institución</h2>
          <div class="content">
              <v-card
                class="mx-auto pa-12 pb-8"
                elevation="4"
                max-width="500"
                rounded="lg"
                style="margin-top: 20px"
              >
                <div class="text-subtitle-1 text-medium-emphasis">Correo</div>
                <v-responsive class="mx-auto" max-width="400">
                    <v-text-field v-model="institucion.correoInstitucion" type="correoInstitucion"></v-text-field>
                </v-responsive>
                <div class="text-subtitle-1 text-medium-emphasis">Nombre de la institucion</div>
                <v-responsive class="mx-auto" max-width="400">
                    <v-text-field v-model="institucion.nombreInstitucion" type="input"></v-text-field>
                </v-responsive>
                <v-btn
                  class="mb-8"
                  color="green"
                  size="large"
                  variant="tonal"
                  max-width="500"
                  @click="actualizar"
                >
                  ACTUALIZAR
                </v-btn>
                <router-link to="/vistaInstitucion">
                  <v-btn
                    class="mb-8"
                    color="blue"
                    size="large"
                    variant="tonal"
                  >
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
import axios from 'axios';
import Header from "../components/HeaderInstitucion.vue";

export default {
  components: {
    Header,
  },
  data() {
    return {
      institucion: {
        correoInstitucion: '',
        nombreInstitucion: '',
        id: '', // Agrega la propiedad 'id' al objeto institucion
      },
    };
  },
  mounted(){
    this.getInstitucion();
  },
  computed:{
    valido(){
      return /.+@.+\..+/.test(this.institucion.correoInstitucion);
    }
  },
  methods: {
    getInstitucion(){
      this.institucion = JSON.parse(localStorage.getItem("institucion"));
    },
    async actualizar() {
      try {
        if(!this.valido){
          this.$swal({ 
              icon: 'error',
              title: 'Campos no válidos',
              text: 'Complete los datos'}).then(() => {
          });
        } else {
          // Verificar que la propiedad 'id' esté presente en 'this.institucion'
          if (!this.institucion.id) {
            // Manejar el caso en que no se haya guardado la ID correctamente
            console.error('La ID de la institución no está disponible');
            return;
          }
          
          const res = await axios.put(
            `http://localhost:8090/institucion/actualizarInstitucion/${this.institucion.idInstitucion}`,
            this.institucion
          ); 
          // ... resto de tu lógica ...
        }
      } catch (error) {
        console.error(error);
      }
    },
  }
};
</script>

<style scoped>
.info-details {
    border: 2px solid #a5a4a4;
    border-radius: 10px;
    padding: 15px;
    text-align: left;
    margin: 20px;
}
.sub-titulo {
    border: 2px solid #a5a4a4;
    border-radius: 10px;
    padding: 15px;
    text-align: center;
    margin: 20px;
}
</style>
