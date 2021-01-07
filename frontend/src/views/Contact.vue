<template>
  <div :class="`contact ${loaded ? 'loaded' : ''}`">
    <div class="jumbotron">
      <figure>
        <picture>
          <img src="@/assets/contact.jpg" alt />
        </picture>
        <figcaption>
          <h1>Skontaktuj się z nami</h1>
        </figcaption>
      </figure>
    </div>
    <section class="contact_list">
      <section class="normal">
        <ContactItem position="normal" />
      </section>
      <section class="alarm">
        <ContactItem position="alarm" />
      </section>
    </section>

    <section class="contact_form">
      <ContactItem position="form" />
      <ContactForm />
    </section>

    <section class="contact_loyalty">
      <SectionTitle sub="w celach biznesowych" />
      <ContactItem aligned position="loyal" />
    </section>
  </div>
</template>

<script>
import SectionTitle from '@/components/SectionTitle'
import ContactItem from '@/components/contacts/ContactItem'
import ContactForm from '@/components/contacts/ContactForm'
export default {
  name: 'Contact',
  components: { ContactItem, ContactForm, SectionTitle },
  created() {
    this.$store.dispatch('contacts/getContacts')
  },
  data() {
    return {
      loaded: false
    }
  },
  methods: {
    setLoaded: function() {
      setTimeout(() => {
        this.loaded = true
      }, 200)
    }
  },
  mounted() {
    this.setLoaded()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang='scss'>
.contact {
  opacity: 0;

  &.loaded {
    transition: .3s;
    opacity: 1;
  }
  &_list {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 90%;
    margin: 0 auto;
    padding: 100px 0;
    section {
      width: 100%;
      &.alarm {
        text-align: right;
        /deep/ .contact_item h1 {
          color: $red;
        }
      }
    }
  }

  &_form {
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

  &_loyalty {
    padding-bottom: 100px;

    .page__header {
      padding: 50px 0;
    }
    .contact_item {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
  }

  .jumbotron {
    display: none;
  }
}

@media (min-width: 768px) {
  .contact {
    &_list {
      flex-direction: row;
      section {
        width: 50%;
      }
    }

    &_form {
      height: 400px;
      margin: 200px 0;
      flex-direction: row;
      .contact_form,
      .contact_item {
        width: 40%;
      }
    }

    .jumbotron {
      display: block;
      height: 500px;
      width: 100%;
      margin-top: 100px;
      text-align: left;

      h1,
      p {
        margin: 0;
        padding: 0;
      }
      h1 {
        line-height: 6rem;
        font-size: 6rem;
      }
      p {
        margin: 0;
        margin-bottom: 4rem;
        font-size: 3rem;
      }
      figure {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 500px;
        position: relative;
        &::after {
          content: '';
          background: $bg;
          opacity: 0.5;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          z-index: 20;
          position: absolute;
        }
        figcaption {
          z-index: 400;
          position: absolute;
          width: 80%;
          height: 100%;
          top: 0;
          bottom: 0;
          right: 0;
          margin: auto;
          left: 0;
          display: flex;
          align-items: center;
          h1 {
            font-weight: 500;
            font-size: 4rem;
          }
        }
      }

      picture {
        img {
          object-position: 50% 30%;
          object-fit: cover;
          width: 100%;
          height: 500px;
        }
      }
    }
  }
}
</style>
