<template>
  <v-layout class="rounded rounded-md centered-layout">
    <Header />
    <div class="centered-message">
      <h1>
        <img
          alt="Vue logo"
          class="logo"
          src="@/assets/logo_sai_usach_4.png"
          width="100"
          height="100"
        />
      </h1>
      <p class="titulo">¿Qué Emergencia desea seleccionar?</p>
      <v-select
        v-model="selectedEmergencia"
        :items="historial.map((emergencia) => emergencia.nombreEmergencia)"
        label="Seleccionar emergencia"
        @update:modelValue="seleccionarEmergencia()"
      ></v-select>

      <div class="input-container">
        <v-text-field
          v-model="cantidadVoluntarios"
          label="Cuantos voluntarios necesita"
          type="number"
          outlined
        ></v-text-field>
      </div>

      <div class="input-container">
        <v-btn
          class="mb-8 btn-volver"
          color="success"
          @click="aceptarEmergencia"
          >ACEPTAR</v-btn
        >
        <router-link to="/vistaInstitucion">
          <v-btn class="mb-8" color="blue" size="large" variant="tonal">
            VOLVER AL INICIO
          </v-btn>
        </router-link>
      </div>
    </div>
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
      historial: [],
      voluntario: "",
      selectedEmergencia: null,
      cantidadVoluntarios: 0,
      emergencia: null,
    };
  },
  mounted() {
    this.getVol();
    this.cargarEmergencias();
  },
  methods: {
    async cargarEmergencias() {
      try {
        const response = await axios.get(
          "http://localhost:8090/emergencia/verEmergencia"
        );
        this.historial = response.data;
      } catch (error) {
        console.error("Error al cargar emergencias:", error);
      }
    },
    seleccionarEmergencia: function() {
      if (this.selectedEmergencia !== null) {
        const emergenciaSeleccionada = this.historial.find(
          (Emergencia) =>
            Emergencia.nombreEmergencia === this.selectedEmergencia
        );
        if (emergenciaSeleccionada) {
          this.verDetallesEmergencia(emergenciaSeleccionada.idEmergencia);
          this.emergencia = emergenciaSeleccionada
        }
      }
    },
    verDetallesEmergencia(idEmergencia) {
      console.log(`Ver detalles de la Emergencia con ID ${idEmergencia}`);
    },


    async aceptarEmergencia() {
      try {
        const response = await axios.get(
          "http://localhost:8090/voluntario/voluntarioscercanos/" + this.emergencia.idEmergencia + "/" +this.cantidadVoluntarios
        );
        localStorage.setItem('voluntariosCercanos',JSON.stringify(response.data));
        this.$router.push('/voluntariosCercanos');
      } catch (error) {
        console.error("Error al cargar emergencias:", error);
      }

    },
    getVol() {
      this.voluntario = JSON.parse(localStorage.getItem("voluntario"));
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

.titulo {
  font-size: 34px;
  font-weight: bold;
  padding: 15px;
  border: 2px solid #020202;
  border-radius: 10px;
  background-color: #ea7600;
}

.btn-volver {
  margin: 5px;
  width: 180px; /* Cambia el ancho para que ambos botones tengan el mismo tamaño */
  padding: 8px 20px;
  border-radius: 4px;
  cursor: pointer;
}

.btn-volver[color="blue"] {
  background-color: #3498db;
  color: white;
  border: none;
}

.btn-volver[color="success"] {
  background-color: #4caf50;
  color: white;
  border: none;
  opacity: 0.8;
}

.btn-volver:hover {
  opacity: 0.8;
}
</style>
