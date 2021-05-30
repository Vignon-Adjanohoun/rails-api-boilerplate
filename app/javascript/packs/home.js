import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import { Button, Loading, Notification } from 'element-ui'
import App from '../views/home.vue'

import 'element-ui/lib/theme-chalk/index.css'
import "../stylesheets/home"

import axios from 'axios'
import moment from 'moment'

Vue.use(TurbolinksAdapter)
Vue.use(Button)
Vue.use(Loading.directive)
Vue.prototype.$notify = Notification

Vue.prototype.$axios = axios
Vue.prototype.$moment = moment

document.addEventListener('turbolinks:load', () => {
  Vue.prototype.$axios.defaults.headers.common['X-CSRF-Token'] = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')
  
  var element = document.getElementById("home")

  const props = {}
  new Vue({
    el: element,
    render: h => h(App, { props })
  })
})
