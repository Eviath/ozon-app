/* eslint-disable quotes */
import Vue from 'vue'
import VueRouter from 'vue-router'

import Signin from '@/components/Signin'
import ServiceList from '@/components/services/ServiceList'
import ServiceView from '@/components/services/ServiceView'
import Home from '@/views/Home'
import Contact from '@/views/Contact'
import Pricing from '@/views/Pricing'
import Policy from '@/views/Policy'
import Cookies from '@/views/Cookies'
import About from '@/views/About'
import Information from '@/views/Information'
import NotFoundComponent from '@/views/404'

Vue.use(VueRouter)


const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: {
      title: 'Strona Główna | Ozon Expert',
      metaTags: [
        {
          name: 'description',
          content: 'Kompleksowa likwidacja bakterii, pleśni, roztoczy, zarodników grzybów, wirusów i alergenów dla firm i osób prywatnych na terenie województwa pomorskiego.'
        },
        {
          property: 'og:description',
          content: 'Kompleksowa likwidacja bakterii, pleśni, roztoczy, zarodników grzybów, wirusów i alergenów dla firm i osób prywatnych na terenie województwa pomorskiego.'
        }
      ]
    }
  },
  {
    path: '/kontakt',
    name: 'Contact',
    component: Contact,
    meta: {
      title: 'Kontakt | Ozon Expert',
      metaTags: [
        {
          name: 'description',
          content: 'Zadzwoń i umów się na spotkanie! Staramy się odpowiadać na wszystkie zgłoszenia w ciągu 24 godzin. Najczęściej robimy to nawet szybciej.'
        },
        {
          property: 'og:description',
          content: 'Zadzwoń i umów się na spotkanie! Staramy się odpowiadać na wszystkie zgłoszenia w ciągu 24 godzin. Najczęściej robimy to nawet szybciej.'
        }
      ]
    }
  },
  {
    path: '/cennik',
    name: 'Pricing',
    component: Pricing,
    meta: {
      title: 'Cennik | Ozon Expert',
      metaTags: [
        {
          name: 'description',
          content: 'Sprawdź, jakie usługi oferujemy. Zamów ozonowanie i ciesz się czystym, świeżym powietrzem. Staramy się indywidualnie podchodzić do potrzeb każdego z naszych klientów. Dlatego nie mamy ściśle ustalonego cennika usług. Wycena jest zawsze indywidualna, sporządzamy ją po przeprowadzeniu bezpłatnej konsultacji u klienta. '
        },
        {
          property: 'og:description',
          content: 'Sprawdź, jakie usługi oferujemy. Zamów ozonowanie i ciesz się czystym, świeżym powietrzem. Staramy się indywidualnie podchodzić do potrzeb każdego z naszych klientów. Dlatego nie mamy ściśle ustalonego cennika usług. Wycena jest zawsze indywidualna, sporządzamy ją po przeprowadzeniu bezpłatnej konsultacji u klienta. '
        }
      ]
    }
  },
  {
    path: '/onas',
    name: 'About',
    component: About,
    meta: {
      title: 'O Nas | Ozon Expert',
      metaTags: [
        {
          name: 'description',
          content: 'Mamy wieloletnie doświadczenie w ozonowaniu i dezynfekcji, dlatego nasze usługi kierujemy zarówno do klientów indywidualnych, jak i firm. Każde zlecenie jest dla nas najważniejsze, dlatego do każdego klienta podchodzimy w pełni indywidualnie. '
        },
        {
          property: 'og:description',
          content: 'Mamy wieloletnie doświadczenie w ozonowaniu i dezynfekcji, dlatego nasze usługi kierujemy zarówno do klientów indywidualnych, jak i firm. Każde zlecenie jest dla nas najważniejsze, dlatego do każdego klienta podchodzimy w pełni indywidualnie. '
        }
      ]
    }
  },
  {
    path: '/admin',
    name: 'Signin',
    component: Signin,
    meta: {
      title: 'Logowanie | Ozon Expert'
    }
  },
  {
    path: '/uslugi',
    name: 'services',
    component: ServiceList,
    meta: {
      title: 'Usługi | Ozon Expert',
      metaTags: [
        {
          name: 'description',
          content: 'Sprawdź zakres naszych usług – razem szybko i bezstresowo rozwiążemy Twój problem. Przekonaj się sam, jak może poprawić się jakość życia po przeprowadzeniu zabiegu ozonowania. Umów się na konsultację już dziś. '
        },
        {
          property: 'og:description',
          content: 'Sprawdź zakres naszych usług – razem szybko i bezstresowo rozwiążemy Twój problem. Przekonaj się sam, jak może poprawić się jakość życia po przeprowadzeniu zabiegu ozonowania. Umów się na konsultację już dziś. '
        }
      ]
    }
  },
  {
    path: '/informacje',
    name: 'information',
    component: Information,
    meta: {
      title: 'Informacje | Ozon Expert',
      metaTags: [
        {
          name: 'description',
          content: 'O ozonowaniu wiemy wszystko. Przeprowadzimy Cię przez bezpieczne ozonowanie dowolnego obiektu. Zajmujemy się profesjonalnym czyszczeniem pomieszczeń, samochodów i obiektów.'
        },
        {
          property: 'og:description',
          content: 'O ozonowaniu wiemy wszystko. Przeprowadzimy Cię przez bezpieczne ozonowanie dowolnego obiektu. Zajmujemy się profesjonalnym czyszczeniem pomieszczeń, samochodów i obiektów.'
        }
      ]
    }
  },
  {
    path: '/uslugi/:id',
    name: 'service',
    props: true,
    component: ServiceView,
    meta: {
      title: 'Usługi | Ozon Expert'
    }
  },
  {
    path: '/polityka',
    name: 'policy',
    component: Policy
  },
  {
    path: '/ciasteczka',
    name: 'cookies',
    component: Cookies
  },
  {
    path: '*',
    component: NotFoundComponent,
    meta: {
      title: '404 | Ozon Expert'
    }
  }
]

const router = new VueRouter({
  routes,
  mode: 'history',
  scrollBehavior(to) {
    if (to.hash) {
      return window.scrollTo({ top: document.querySelector(to.hash).offsetTop, behavior: 'smooth' })
    } else {
      return { x: 0, y: 0 }
    }

  }
})

// This callback runs before every route change, including on page load.
router.beforeEach((to, from, next) => {
  // This goes through the matched routes from last to first, finding the closest route with a title.
  // eg. if we have /some/deep/nested/route and /some, /deep, and /nested have titles, nested's will be chosen.
  const nearestWithTitle = to.matched.slice().reverse().find(r => r.meta && r.meta.title)

  // Find the nearest route element with meta tags.
  const nearestWithMeta = to.matched.slice().reverse().find(r => r.meta && r.meta.metaTags)

  // If a route with a title was found, set the document (page) title to that value.
  if (nearestWithTitle) document.title = nearestWithTitle.meta.title

  // Remove any stale meta tags from the document using the key attribute we set below.
  Array.from(document.querySelectorAll('[data-vue-router-controlled]')).map(el => el.parentNode.removeChild(el))

  // Skip rendering meta tags if there are none.
  if (!nearestWithMeta) return next()

  // Turn the meta tag definitions into actual elements in the head.
  nearestWithMeta.meta.metaTags.map(tagDef => {
    const tag = document.createElement('meta')

    Object.keys(tagDef).forEach(key => {
      tag.setAttribute(key, tagDef[key])
    })

    // We use this to track which meta tags we create, so we don't interfere with other ones.
    tag.setAttribute('data-vue-router-controlled', '')

    return tag
  })
    // Add the meta tags to the document head.
    .forEach(tag => document.head.appendChild(tag))

  next()
})


export default router
