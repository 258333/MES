import {
	createApp
} from 'vue'; // Vue 3 中使用 createApp 代替 new Vue
import App from './App.vue'; // 如果你使用 Vue 3，请确保文件后缀是 .vue
import store from './store'; // store
import plugins from './plugins'; // plugins
import './permission'; // permission

const app = createApp(App); // 使用 createApp 来创建应用实例

app.use(store); // 使用 Vuex
app.use(plugins); // 使用插件



app.config.productionTip = false; // 等效于 Vue.config.productionTip

app.mount('#app'); // Vue 3 中的应用挂载