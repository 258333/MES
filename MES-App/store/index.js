// Vue 3 版本
import {
	createStore
} from 'vuex';
import user from '@/store/modules/user';
import getters from './getters';
import config from '../config';

const store = createStore({
	modules: {
		user
	},
	getters,
});

export default store;