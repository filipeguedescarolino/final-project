<template>

  <v-row>
    <v-col>
      <v-sheet height="1000">
        <v-calendar
          ref="calendar"
          v-model="value"
          type="week"
          :events="events"
          @click:event="showEvent"
        >
        
          <template v-slot:day-body="{ date, week }">
            <div
              class="v-current-time"
              :class="{ first: date === week[0].date }"
              :style="{ top: nowY }"
            ></div>
          </template>
        </v-calendar>
      </v-sheet>
    </v-col>
  </v-row>
</template>


<script>
    import {mapGetters} from 'vuex'
    import axios from 'axios'
    import moment from 'moment'
  export default {
    data: () => ({
      value: '',
      ready: false,
      events: []
        // {
        //   name: 'Weekly Meeting',
        //   start: '2021-07-09 09:00',
        //   end: '2021-07-09 09:30',
        // },
        // {
        //   name: `Thomas' Birthday`,
        //   start: '2019-01-10',
        // },
        // {
        //   name: 'Mash Potatoes',
        //   start: '2019-01-09 12:30',
        //   end: '2019-01-09 15:30',
        // },
     
    }),
    computed: {
       
        ...mapGetters([
        'user',
        'token'
        ]),

        cal () {
        return this.ready ? this.$refs.calendar : null
        },
        nowY () {
        return this.cal ? this.cal.timeToY(this.cal.times.now) + 'px' : '-10px'
        },
    },
    mounted () {
        this.ready = true
        this.scrollToTime()
        this.updateTime()
    },
    methods: {


        showEvent(a ) {
          this.$router.push(`/patients/${a.event.id}`)
          
          
          
        },

        getAppointmentsForDoctor() {
            debugger
            axios.get(`http://localhost:3000/appointments/doctor/${this.user.id}`).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    })
                  console.log(response) 
                debugger 
                for (let i = 0; i < response.data.data.length; i++) {
                    let a = {
                        "name": response.data.data[i].patientName,
                        "start": `${moment(response.data.data[i].day).format("YYYY-MM-DD")} ${response.data.data[i].hour}`,
                        "end" : `${moment(response.data.data[i].day).format("YYYY-MM-DD")} ${response.data.data[i].end_at}`,
                        "id": response.data.data[i].id_patient
                    }
                    this.events.push(a);

                    a = null
                    }                   
                })
                .catch((error) => {
                    this.$swal.fire({
                        icon: 'error',
                        title: 'ERROR!',
                        text: error,
                        showConfirmButton: false,
                        timer: 1500
                    })
                });
        },

        getCurrentTime () {
            return this.cal ? this.cal.times.now.hour * 60 + this.cal.times.now.minute : 0
        },
        scrollToTime () {
            const time = this.getCurrentTime()
            const first = Math.max(0, time - (time % 30) - 30)

            this.cal.scrollToTime(first)
        },
        updateTime () {
            setInterval(() => this.cal.updateTimes(), 60 * 1000)
        },
    },


    async created() {
        await this.getAppointmentsForDoctor()
    }
  }
</script>


<style lang="scss">
.v-current-time {
  height: 2px;
  background-color: #ea4335;
  position: absolute;
  left: -1px;
  right: 0;
  pointer-events: none;

  &.first::before {
    content: '';
    position: absolute;
    background-color: #ea4335;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    margin-top: -5px;
    margin-left: -6.5px;
  }
}
</style>