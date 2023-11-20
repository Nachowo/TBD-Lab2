<template>
  <v-layout class="rounded rounded-md centered-layout">
    <Header />
    <div class="centered-message">
      <h1>
        <img alt="Vue logo" class="logo" src="@/assets/logo_sai_usach_4.png" width="100" height="100" />
      </h1>
      <p class="titulo">Voluntarios Cercanos</p>
      <div class="tabla-container">
        <table class="tabla">
          <thead>
          <tr>
            <th>Nombre del Voluntario</th>
            <th>Email del Voluntario</th>
          </tr>
        </thead>
          <tbody>
            <tr v-for="voluntario in voluntarios" :key="voluntario.idVoluntario">
              <td>{{ voluntario.nombreCompletoVoluntario}}</td>
              <td>{{ voluntario.emailVoluntario }}</td>
            </tr> 
          </tbody>
        </table>
      </div>
      <div class="input-container">
      </div>
    </div>
  </v-layout>
</template>

<script>
  import axios from 'axios';
  import Header from "../components/HeaderInstitucion.vue";
  import { VLayoutItem } from 'vuetify/lib/components/index.mjs';
  export default {
    components: {
      Header,
    },
    data() {
      return {
        voluntarios: [],
      };
    },
    mounted() {
      this.mostrarvoluntarios();
    },
    methods: {
    async mostrarvoluntarios(){
            const voluntariosString = localStorage.getItem("voluntariosCercanos");
            this.voluntarios = JSON.parse(voluntariosString);
            console.log(this.voluntarios);
        },
    }
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
    background-color: #EA7600;
  }
  
  .tabla-container {
    margin-top: 20px;
  }
  
  .tabla {
    width: 100%;
    margin: 0 auto;
    border-collapse: collapse;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  }
  
  .tabla th,
  .tabla td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  
  .tabla th {
    background-color: #EA7600;
    color: white;
  }
</style>