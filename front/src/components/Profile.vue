<template>
    
    <div>
        <v-row
            :align="align"
            no-gutters
            style="height: 150px;"
        >
        
            <v-col
            v-for="n in 3"
            :key="n"
            >
                <v-card max-width="300" class="mx-auto my-12">

                    <v-img width="400" height="300"
                        :src=profile.image />
                    <v-card-title> 
                        {{profile.name}} 
                    </v-card-title>

                    <v-card-text>
                        <v-row align="center"
                            class="mx-0">

                            <v-rating
                                :value="profile.rating"
                                color="indigo"
                                size="14"
                                dense
                                half-increments/>

                            <div class="grey--text ml-4 text-uppercase">
                                {{profile.rating}}
                            </div>

                        </v-row>

                        <div class="my-4 subtitle-1 black--text">
                            {{profile.specialty}}
                        </div>

                        <div>
                            {{profile.address}}
                        </div>

                    </v-card-text>
                    <v-divider> </v-divider>
                </v-card>
            </v-col>
        </v-row> 
    </div>
   

</template>

<script>
export default {
    name: 'Profile',
    data () {
        return {

            profile: {
                image: "https://www.csaudeboavista.com/wp-content/uploads/2016/05/Dr.-Rui-Carolino-Pediatria-CSB.jpg",
                name: "Rui Carolino",
                rating: 5,
                specialty: "Pediatrics",
                address: "Porto",
                avaliability: [
                    {
                        "id": 1,
                        "time": "8:30"
                    },

                    {
                        "id": 2,
                        "time": "9:00"
                    },

                    {
                        "id": 3,
                        "time": "9:30"
                    },

                    {
                        "id": 4,
                        "time": "10:00"
                    },

                    {
                        "id": 5,
                        "time": "10:30"
                    },
                ]
            }

            
            
            



        }
    }
}
</script>