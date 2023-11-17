<script>
import axios from "axios";
import mapboxgl from 'mapbox-gl';
export default {
  name: "register",
  mounted() {
    /*
    MAPA

    mapboxgl.accessToken = 'pk.eyJ1IjoibmFjaG93byIsImEiOiJjbHAyeTVmamMwM2o0MmpzMWN1OTV3eWt1In0.M8r291Kj6H18Wp80JkRx4g';
    const map = new mapboxgl.Map({
      container: 'map', 
      style: 'mapbox://styles/mapbox/streets-v12',
      center: [-70.6483, -33.4378], // Longitud y Latitud iniciales
      zoom: 13 // starting zoom
    });}*/
  },
  data() {
    return {
      userAddress: "",
      emailVoluntario:"",
      rut:"",
      nombre:"",
      password: "",
      error: "",
      latitud: "",
      longitud: ""
    };
  },
  computed:{
    valido(){
      return /.+@.+\..+/.test(this.emailVoluntario);
    }
  },
  methods: {
    async registrar() {
      try {
        if(!/.+@.+\..+/.test(this.emailVoluntario)){
          this.$swal({ 
              icon: 'error',
              title: 'Correo no valido',
              text: 'Ingrese un correo valido',
          })
        }else{
          console.log("inicio geoCodear con: "+this.userAddress);
          await this.geoCodear(this.userAddress);
          console.log("fin geoCodear + long y lati:"+this.longitud+" "+this.latitud);
          const response = await axios({
          method: "POST",
          url: "http://localhost:8090/voluntario/register",
          data: {
            emailVoluntario: this.emailVoluntario,
            contraseniaVoluntario: this.password,
            nombreCompletoVoluntario: this.nombre,
            rutVoluntario: this.rut,
            longitud: this.longitud,
            latitud: this.latitud
          },
        });
        if (response.status === 200) {
          this.$swal({ 
              icon: 'success',
              title: 'Éxito',
              text: 'Su perfil de Voluntario se creó exitosamente',
          }).then(() => {
              this.$router.push('/login'); // Redirige al usuario
          });
        } 
        
        }        
      } catch (error) {
        this.$swal({
          icon: "error",
          title: "Error",
          text: "Error al registrarse",
        });
      }
    },
    async geoCodear(direccion){
      try {
        //solicitud a la API de Mapbox
      const response = await fetch(
        `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(
          direccion
        )}.json?access_token=pk.eyJ1IjoibmFjaG93byIsImEiOiJjbHAyeTVmamMwM2o0MmpzMWN1OTV3eWt1In0.M8r291Kj6H18Wp80JkRx4g`
      );

      const data = await response.json();

      // Lista de features => coincidencias
      // la primera es la mas parecida

      const location = data.features[0].center;
      this.latitud = location[1];
      this.longitud = location[0];
      console.log('Latitud:', location[1]);
      console.log('Longitud:', location[0]);
    } catch (error) {
      console.error('Error al geocodificar la dirección:', error);
    }
  }
    }
  
};
</script>
<template>
  <h3 style="text-align: center; margin-top: 40px;">
        CREAR CUENTA VOLUNTARIO
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
          label="Correo"
          placeholder="Introduzca su email de usuario"
          type="email"
          v-model="emailVoluntario"
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
          placeholder="Introduzca su nombre"
          type="input"
          v-model="nombre"
        ></v-text-field>
      </v-responsive>

      <v-responsive class="mx-auto" max-width="400">
        <v-text-field
          label="Rut"
          placeholder="Introduzca su Rut"
          type="input"
          v-model="rut"
        ></v-text-field>
      </v-responsive>
      
      

      <!--
        <div class="map-container" >
        <div id="map"></div>
      </div>
      -->

      <v-responsive class="mx-auto" max-width="400">
        <v-text-field
          label="Dirección"
          placeholder="Introduzca su dirección"
          v-model="userAddress"
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
@import 'mapbox-gl/dist/mapbox-gl.css';

  #map {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 100%;
}
.map-container {
margin: 0 auto;
  width: 300px; 
  height: 300px; 
  position: relative;
  margin-bottom: 50px;
}
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
