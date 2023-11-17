<template>
    <div ref="map" class="map"></div>
  </template>
  
  <script>
  import mapboxgl from 'mapbox-gl';
  
  export default {
    name: 'MapComponent',
    data() {
      return {
        map: null,
      };
    },
    mounted() {
      this.initializeMap();
    },
    methods: {
      initializeMap() {
        this.map = new mapboxgl.Map({
          container: this.$refs.map,
          style: 'mapbox://styles/mapbox/streets-v11', // Puedes cambiar el estilo según tus preferencias
          center: [-74.5, 40], // Coordenadas de inicio [longitud, latitud]
          zoom: 9, // Nivel de zoom inicial
        });
      },
    },
  };
  </script>
  
  <style scoped>
  .map {
    height: 100vh;
  }
  </style>
  