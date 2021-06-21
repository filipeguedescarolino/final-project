<template>
    
    <div>
        <v-row
            
            no-gutters
            style="height: 150px;"
        >
        
            <v-col
            v-for= "(profile,index) in profiles" :key="index"
            
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

            profiles: [
                {
                image: "https://www.csaudeboavista.com/wp-content/uploads/2016/05/Dr.-Rui-Carolino-Pediatria-CSB.jpg",
                name: "Rui Carolino",
                rating: 5,
                specialty: "Pediatrics",
                address: "Porto",
                },
                {
                image: "https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png",
                name: "Cassilda Carolino",
                rating: 5,
                specialty: "Fisiatrics",
                address: "Porto",
                },
                {
                image: "https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png",
                name: "Vitor Carolino",
                rating: 5,
                specialty: "Neurocirurgery",
                address: "Porto",
                },
            ]
        }
    }
    
}
</script>