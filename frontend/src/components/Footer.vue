<template>
  <footer>
    <main>
      <header>
        <section>
          <Brand />
          <p>Kompleksowa likwidacja bakterii, pleśni, roztoczy, zarodników grzybów, wirusów i alergenów dla firm i osób prywatnych na terenie województwa pomorskiego.</p>
        </section>

        <ContactList vertical />

        <section class="nav__section">
          <h1>Nawigacja</h1>
          <Navigation />
        </section>

        <section class="nav__section">
          <h1>Zasoby</h1>
          <Navigation resources />
        </section>

        <section class="btn__section">
          <router-link class="btn btn--dark" to="/kontakt">Umów się teraz</router-link>
        </section>
      </header>
      <hr />
      <section class="bottom">
        2020 |
        Created by
        <strong>Eviathos.pl</strong> | All rights reserved.
      </section>
    </main>
  </footer>
</template>

<script>
import Navigation from '@/components/navigation/Navigation'
import Brand from '@/components/navigation/Brand'
import ContactList from '@/components/contacts/ContactList'
export default {
  name: 'Footer',
  components: { Navigation, Brand, ContactList }
}
</script>

<style scoped lang="scss">
footer {
  text-align: left;
  height: auto;
  background: #fff;
  color: $gray;
  width: 100%;
  main {
    display: flex;
    flex-direction: column;
    height: 100%;
    width: 90%;
    margin: 0 auto;

    hr {
      width: 40%;
      border-bottom-color: $gray;
      opacity: 0.1;
    }

    .bottom {
      padding: 1rem 0;
      height: 10%;
      font-size: 0.6rem;
      text-align: center;
    }
    header {
      justify-content: center;
      align-items: center;
      display: flex;
      flex-direction: column;
      height: 90%;
      text-align: left;
      width: 100%;

      padding: 2rem;
      box-sizing: border-box;

      .nav__section {
        justify-content: flex-start;
      }

      .btn__section {
        justify-content: center;
        align-items: center;
        margin-top: 2rem;
        width: 80%;
        .btn {
          width: fit-content;
        }
      }

      .footer_contact {
        display: flex;
        padding: 1rem;
        text-align: center;
        color: $bg;
        font-weight: 500;
        span {
          margin-right: 15px;
        }
        div {
          padding: 0.7rem 0rem;
        }
      }
      section {
        h1 {
          text-transform: uppercase;
        }
        width: 100%;
        text-align: center;
        justify-content: center;
        flex-direction: column;
        display: flex;
      }
    }
  }
}

// Small devices (landscape phones, 576px and up)
@media (min-width: 576px) {
}

// Medium devices (tablets, 768px and up)
@media (min-width: 768px) {

}

// Large devices (desktops, 992px and up)
@media (min-width: 992px) {
    footer {
    main {
      hr {
        margin-left: 0;
      }
      header {
        flex-direction: row;
        align-items: initial;
        padding: 0;

        section {
          width: 100%;
          text-align: left;
        }

        .footer_contact {
          padding: 4rem 1rem;
          text-align: left;
          div {
            padding: 0.7rem 2rem;
          }
        }

        .btn__section {
          justify-content: flex-end;
          margin-top: 0;
          align-items: flex-end;
        }
      }
      .bottom {
        font-size: 0.8rem;
        text-align: left;
      }
    }
  }
}

// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) {
}
</style>
