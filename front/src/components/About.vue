<template>
    <div>
        <h3 class="text-center mt-3"> 
            Who are we?
        </h3>
        <p class="text-justify pa-4">
            Morbi mattis ullamcorper velit. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Fusce convallis metus id felis luctus adipiscing. Aenean massa. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.
        </p>

        <p class="text-justify pa-6">
            Morbi mattis ullamcorper velit. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Fusce convallis metus id felis luctus adipiscing. Aenean massa. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.

            Nulla consequat massa quis enim. Praesent venenatis metus at tortor pulvinar varius. Donec venenatis vulputate lorem. Phasellus accumsan cursus velit. Pellentesque ut neque.
        </p>

        <button @click="getTime(beginHour, endHour)"> GETIT </button>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            doctorId: 6,
            beginHour: "16:00",
            day: "2021-10-11",
            endHour: "19:00",
            clinicalOfficeId: 1,
            brackets: '' 
        }
        
    },

    methods: {


      // get() {
      //   axios.get('http://localhost:3000/patients?page=1&limit=5').then((response) => {
      //     console.log(response)
      //   })
      // },
        getTime(a,b) {
            let toInt  = time => ((h,m) => h*2 + m/30)(...time.split(':').map(parseFloat))
        let toTime = int => [Math.floor(int/2), int%2 ? '30' : '00'].join(':')
        let range  = (from, to) => Array(to-from+1).fill().map((_,i) => from + i)
        let eachHalfHour = (t1, t2) => range(...[t1, t2].map(toInt)).map(toTime);
        return this.brackets = eachHalfHour(a, b)
        
        
        
        
        },

        async registerClient() {
            this.getTime(this.beginHour, this.endHour)

            let workingHour = {
            "id_doctor": this.doctorId,
            "begin_hour": this.beginHour,
            "day": this.day,
            "end_hour": this.endHour,
            "id_clinical_office": this.clinicalOfficeId,          
            }

            console.log(workingHour)
            await axios.post('http://localhost:3000/workingHours', workingHour).then(response =>  console.log(response.data.id))      
                .catch(error => {
                    this.errorMessage = error.message
                    console.error("There was an error!", error);    
                })
            debugger; // eslint-disable-line no-debugger
            
            console.log(this.brackets)
            debugger; // eslint-disable-line no-debugger
            console.log(this.brackets)
            let mySchedule = {
                            "start_at": this.brackets[i],
                            "end_at": this.brackets[i+1],
                            "id_doctor": this.doctorId,
                            "day": this.day
                        }
            for( var i = 0;  i < this.brackets.length - 1;  i++ )
                {
                    axios.post(`/http://localhost:3000/timeSlots`,  {
                        mySchedule
                        
                    })
                    .then((response) => {
                        // Takes 4 seconds, 4 more seconds, 4 more seconds, etc
                        // Ideally: Takes 4 seconds, returns in the same ~4 seconds, returns in the same ~4 seconds, etc
                        console.log(response);
                        console.log('Que Fking animal Beast')
                    })
                    .catch((error) => {
                        console.log(error);
                        console.log('deuBosta')
                    });

                    // Takes < 1 second, < 1 more second, < 1 more second, etc
                    console.log( 'Request sent!' );
                }

        

    
      }

    },
}
</script>