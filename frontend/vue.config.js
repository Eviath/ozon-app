
const SitemapPlugin = require('sitemap-webpack-plugin').default

const routes = [
  {
    path: '/',
    name: 'Home'
  },
  {
    path: '/kontakt',
    name: 'Contact'
  },
  {
    path: '/cennik',
    name: 'Pricing'
  },
  {
    path: '/onas',
    name: 'About'
  },
  {
    path: '/uslugi',
    name: 'services'
  },
  {
    path: '/informacje',
    name: 'information'
  }
]

module.exports = {
  css: {
    loaderOptions: {
      sass: {
        prependData: '@import "@/styles/_variables.scss";'
      }
    }
  },
  configureWebpack: {
    plugins: [
      new SitemapPlugin('https://ozonexpert.pl', routes, {
        fileName: 'sitemap.xml',
        lastMod: true,
        changeFreq: 'monthly'
      })
    ]
  }
}