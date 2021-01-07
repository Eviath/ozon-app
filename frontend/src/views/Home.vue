<template>
  <main>
    <section class="home" :style="{backgroundImage: 'url('+require('@/assets/screen_bg.webp')+')'}">
      <div class="jumbotron">
        <aside class="read-more">
          <router-link to="/#specjalizacja">DOWIEDZ SIĘ WIĘCEJ</router-link>
        </aside>
        <header>
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 107.37 33.92">
            <path
              class="cls-1"
              d="M100.53,12.17c-1.47.07-3.37-.69-4.88-1a61.26,61.26,0,0,0-7.88-.87C72.29,9.66,57.56,16.08,43,20.23a92.22,92.22,0,0,1-13.44,2.91,33.66,33.66,0,0,1-8.85-.29,16.8,16.8,0,0,1-9.47-4.59c-2.56-2.61-4-6.78-2.3-10.24L9,7.88a13.16,13.16,0,0,1,5.67-5.6,21.55,21.55,0,0,1,6.83-2A29.28,29.28,0,0,1,32.14.7a20.9,20.9,0,0,1,9.41,4.93c.38.36,3.27,3.23,1.89,3.51a1.43,1.43,0,0,1-.94-.28C34.23,4.05,23.68,3.93,14.85,7.59a6.88,6.88,0,0,0-3,2,4.58,4.58,0,0,0-.44,4.51,6.81,6.81,0,0,0,3.31,3.28,13.2,13.2,0,0,0,4.59,1.15,34.67,34.67,0,0,0,14.32-2C39,14.69,43.91,11.93,49.06,9.74,58.21,5.86,67.74,3.37,77.74,3.4,85,3.42,93.26,5,98.74,10A14.85,14.85,0,0,1,100.53,12.17Z"
            />
            <path
              class="cls-1"
              d="M106.72,23.68a14.58,14.58,0,0,0-1.93-1.4,14.18,14.18,0,0,0-4.47-1.66A27.06,27.06,0,0,0,89.13,21c-6.53,1.29-12.71,3.77-18.94,6A124.21,124.21,0,0,1,48,32.56a86.18,86.18,0,0,1-21.81,1.07,48.62,48.62,0,0,1-9.72-1.84,31.07,31.07,0,0,1-9.15-4.31,20.17,20.17,0,0,1-3.56-3.22,16.51,16.51,0,0,1-2.63-4,14.9,14.9,0,0,1-.71-1.89c-.08-.3-.17-.62-.23-.93a2.45,2.45,0,0,1-.14-1c.11,0,.23.12.29.21a5.63,5.63,0,0,1,.38.68,10.93,10.93,0,0,0,2,2.42,38,38,0,0,0,3.6,3.22c10.11,7.45,24.18,5.8,35.62,3,10.26-2.53,20.14-6.3,30.31-9.12h0c1.16-.33,2.33-.65,3.5-1,5.39-1.46,11-2.92,16.65-2a22.11,22.11,0,0,1,14.74,9.41C107.62,23.91,107.22,24.11,106.72,23.68Z"
            />
          </svg>
          <h1>{{ msg }}</h1>
          <p>Gwarancja Czystego Powietrza</p>
          <router-link class="btn" to="/kontakt">Umów się teraz</router-link>
        </header>
        <EventList />
      </div>
      <video
        ref="video"
        muted
        loop
        autoplay
        poster="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
      >
        <source src="@/assets/1080p.mp4" type="video/mp4" />
        <source src="@/assets/1080p.webm" type="video/webm" />Your browser does not support the video tag.
      </video>
    </section>

    <section id="specjalizacja">
      <Specialisation />
    </section>

    <section>
      <ServiceList />
    </section>

    <section class="contact_form">
      <ContactItem position="form" />
      <ContactForm />
    </section>
  </main>
</template>

<script>
import EventList from '@/components/events/EventList.vue'
import ServiceList from '@/components/services/ServiceList.vue'
import ContactForm from '@/components/contacts/ContactForm.vue'
import ContactItem from '@/components/contacts/ContactItem.vue'
import Specialisation from '@/components/informations/Specialisation'

export default {
  name: 'Home',
  components: {
    EventList,
    ServiceList,
    Specialisation,
    ContactForm,
    ContactItem
  },
  mounted() {
    this.videoElement.play()
  },
  computed: {
    videoElement() {
      return this.$refs.video
    }
  },
  data() {
    return {
      msg: 'Ozon Expert'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang='scss'>
.contact_form {
  background: #fff;
  height: auto;
  width: 100%;
  display: flex;
  justify-content: space-evenly;
  flex-direction: column;
  .contact_form,
  .contact_item {
    width: 100%;
  }
  .contact_item {
    box-sizing: border-box;
    display: flex;
    justify-content: center;
    flex-direction: column;
    color: $second;
  }
}

.home {
  text-align: left;
  display: flex;
  justify-content: center;
  width: 100%;
  height: 100vh;
  align-items: center;
  background-repeat: no-repeat;
  background-size: cover;

  video {
    display: none;
  }
  &::after {
    content: '';
    background: $bg;
    top: 0;
    left: 0;
    position: absolute;
    width: 100%;
    z-index: 50;
    height: 100vh;
    opacity: 0.6;
  }

  .jumbotron {
    width: 100%;
    height: 100%;
    z-index: 90;
    overflow: hidden;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    text-align: center;
    aside.read-more {
      display: none;
    }

    header {
      text-align: center;
      width: 80%;
      margin: 0 auto;
      justify-content: center;
      display: flex;
      height: 100vh;
      align-items: center;
      flex-direction: column;

      svg {
        fill: #fff;
        width: 50%;
      }

      .btn {
        transition: 0.3s;
        border-radius: 5px;
        opacity: 0;
        background: transparent;
        border: 2px solid #fff;
        color: #fff;
        font-size: 0.7rem;
        padding: 0.7rem 4rem;
        position: relative;
      }

      h1 {
        font-size: 2.5rem;
        line-height: 4rem;
      }

      a {
        margin: 1rem 0;
      }

      h1,
      p {
        margin: 1rem 0;
        padding: 0;
      }
      p {
        margin: 0;
        font-size: 1rem;
      }
    }
  }
}

// Medium devices (tablets, 768px and up)
@media (min-width: 768px) {
  .contact {
    &_form {
      height: 400px;
      margin: 200px 0;
      flex-direction: row;
      .contact_form,
      .contact_item {
        width: 40%;
      }
    }
  }
  .home {
    background: none !important;
    video {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
      position: absolute;
      top: 0;
      left: 0;
    }

    .jumbotron {
      &:hover {
        header {
          opacity: 1;

          h1 {
            transform: translateY(0);
          }

          p {
            opacity: 1;
            transform: translateY(0);
            transition: transform 0.3s 0.3s, opacity 0.3s 0.3s;
          }

          .btn {
            opacity: 1;
          }
        }
      }

      header {
        transition: 0.3s;
        text-align: left;
        position: relative;
        height: initial;
        opacity: 1;
        display: block;

        svg {
          display: none;
        }

        h1 {
          transform: translateY(40px);
          transition: 0.3s 0.2s;
          font-size: 3rem;
          line-height: 1rem;
        }
        p {
          transition: transform 0.3s 0.5s;
          transform: translateY(-40px);
          opacity: 0;
          margin: 0;
          margin-bottom: 2rem;
          font-size: 1.5rem;
        }
      }

      aside.read-more {
        display: block;
        position: absolute;
        left: -20px;
        bottom: 200px;
        transform: rotateZ(-90deg);
        cursor: pointer;
        a {
          color: #fff;
          text-decoration: none;
        }

        &::after {
          content: '';
          background: #fff;
          height: 2px;
          width: 40px;
          position: absolute;
          left: -50px;
          bottom: 0;
          top: 0;
          margin: auto;
        }

        &::before {
          content: '<';
          height: 2px;
          width: 15px;
          position: absolute;
          left: -54px;
          top: 0.4px;
          margin: auto;
        }
      }
    }
  }
}
</style>
