<template>
  <v-layout class="rounded rounded-md">
    <Header />
    <v-main>
      <div class="centered-layout">
        <div class="centered-message">
          <h2 class="sub-titulo">Crear Nueva Emergencia</h2>

          <div class="content">
            <v-card class="mx-auto pa-12 pb-8" elevation="4" max-width="500" rounded="lg" style="margin-top: 20px;">
              <div class="text-subtitle-1 text-medium-emphasis">Nombre de la emergencia</div>
              <v-text-field v-model="nombreEmergencia" type="text"></v-text-field>

              <div class="text-subtitle-1 text-medium-emphasis">Latitud</div>
              <v-text-field v-model="latitud" type="number" step="any"></v-text-field>

              <div class="text-subtitle-1 text-medium-emphasis">Longitud</div>
              <v-text-field v-model="longitud" type="number" step="any"></v-text-field>

              <v-btn class="mb-8" color="green" size="large" variant="tonal" @click="crearEmergencia">
                CREAR EMERGENCIA
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
      nombreEmergencia: '',
      latitud: '',
      longitud: '',
    };
  },
  methods: {
    async crearEmergencia() {
      try {
        
      } catch (error) {
        console.error('Error al crear la emergencia:', error);
        // Manejar errores o mostrar mensajes de error al usuario
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
