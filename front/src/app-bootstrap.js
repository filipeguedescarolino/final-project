import Vue from 'vue'
let bearerInterceptor = {

    process (request)  {
        let token = 'Bearer ' + localStorage.getItem('token');
    
    // request interceptor
        request.headers.common['Authorization'] = token;

        return request
    },

    exception (error) {
            return Promise.reject(error)
    },
}


export async function boot() {

    Vue.axios.interceptors.request.use(bearerInterceptor.process, bearerInterceptor.exception)
}
