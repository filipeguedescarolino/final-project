
<template>
    <v-card>
        <v-card-title>
            <v-text-field
                v-model="search"
                append-icon="mdi-magnify"
                label="Search"
                single-line
                hide-details
            ></v-text-field>
        </v-card-title>
        <v-data-table
            :headers="headers"
            :items="specializations"
            :search="search"
            :items-per-page="5"
            item-key="name"
            class="elevation-1 pa-4"
            :footer-props="{
            showFirstLastPage: true,
            firstIcon: 'mdi-arrow-collapse-left',
            lastIcon: 'mdi-arrow-collapse-right',
            prevIcon: 'mdi-minus',
            nextIcon: 'mdi-plus'
            }">

            <template v-slot:item="props">
                <tr>
                    <td >{{ props.item.description }}</td>
                    <td>{{ props.item.base_price }}</td>                                        
                    <td >                        
                        <i class="fas fa-search mr-3" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'check')"> </i>
                        <i class="fas fa-edit" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'edit')"> </i>                                                                                 
                    </td>                    
                </tr>
            </template>
        </v-data-table>
          
        <show-and-edit  v-model="show" v-if="show"   :specialization="specialization"  :mode="mode"  @save="saveSpecialization(specialization, mode)" > </show-and-edit>
         <!-- Inicia dialog  -->
            <v-dialog v-model="dialogCreate" max-width="900px">
                <v-card>
                    <v-navigation-drawer permanent
                    width="900" class="pa-4">
                    <v-system-bar style="text: center">  Create Specialization</v-system-bar>
                    
                    <v-divider></v-divider>
                    <v-form>
                        <v-container>
                        <v-row>
                            <v-col cols="12" sm="12" >
                            <v-text-field
                                v-model="create.description"
                                
                                
                                label="Description"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="12" >
                            <v-text-field
                                v-model.number="create.base_price"
                                
                                label="Value to be Reimbursed"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>
                            
                        </v-row>
                        </v-container>
                    </v-form>


                    
                    </v-navigation-drawer>
                    <v-card-actions>
                    <v-btn color="primary"  @click=" dialogCreate = false">
                        Return
                    </v-btn>
                    <v-btn
                        depressed
                        color="primary"
                        @click="postSpecialization()">
                       Add Specialization
                    </v-btn>
                            
                    
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <div class="text-center">
                <v-btn
                rounded
                color="primary"
                dark
                x-large
                @click="dialogCreate = !dialogCreate"
                >Add new Specialization
                    <i class="fas fa-plus ml-3" style="cursor: pointer" > </i>
                </v-btn>
            </div>


        <!-- termina dialog  -->
    </v-card>
</template>

<script>
import axios from 'axios'
import ShowAndEdit from './ShowAndEdit.vue'


    export default {
  components: { ShowAndEdit },

        props: {
            specialization: {
                type: Object
            }
      

        },
  
        data () {
            return {
                specializations: [],
                search: '',
                show: false,
                headers: [
                    {
                        text: 'Specializations',
                        align: 'center',
                        sortable: false,
                        value: 'description',
                    },       
                    { text: 'Base_price', value: 'base_price', align: 'center' },                                       
                    { text: 'Edit', value: 'edit', align: 'center'}
                ],
               
                mode: null,
                create: {
                    "description": null,
                    "base_price": null,                    
                },

                dialogCreate: false
                

                
            }
        },
    
        methods: {

            getSpecializations () {
                axios.get('http://localhost:3000/specializations').then((response) => {
                    this.specializations = response.data.data 
                })
            },  
           

            openMaintenaceModal (row, mode) {
                // user que estas a editar
               
                this.specialization = row
                this.mode= mode
                this.show = true
            },

            async saveSpecialization (specialization, mode) {
                
                this.show = false
                if (mode == 'check') {
                    return
                }

                
                
                let specializationUpdate = {
                    "description": specialization.description,
                    "reimbursed_value": specialization.reimbursed_value
                }
                

                await axios.put(`http://localhost:3000/specialization/${specialization.id}`, specializationUpdate).then((response) => {
                    console.log(response);
                    
                    console.log('Que Fking animal Beast')
                })
                .catch((error) => {
                    console.log(error);
                    console.log('deuBosta')
                });
                
                this.getSpecializations()
                        
            },


            postSpecialization() {
                
                
                let specializationCreate = {
                    "description": this.create.description,
                    "reimbursed_value": this.create.reimbursed_value
                }

                axios.post(`http://localhost:3000/specializations`, specializationCreate).then((response) => {
                    console.log(response);
                    alert('correu bem')
                    console.log('Que Fking animal Beast')
                })
                .catch((error) => {
                    console.log(error);
                    console.log('deuBosta')
                });
                
                this.getSpecializations()
                this.dialogCreate = false
            }
                
        },

        

        created() {
            this.getSpecializations()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

