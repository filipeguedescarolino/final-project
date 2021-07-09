
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
            :items="medications"
            :search="search"
            :items-per-page="5"
            item-key="description"
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
                    <td>{{ props.item.observations }}</td>                                        
                    <td >                        
                        <i class="fas fa-search mr-3" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'check')"> </i>
                        <i class="fas fa-edit" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'edit')"> </i>                                                                                 
                    </td>                    
                </tr>
            </template>
        </v-data-table>
          
        <show-and-edit  v-model="show" v-if="show"   :medication="medication"  :mode="mode"  @save="saveMedication" > </show-and-edit>
         <!-- Inicia dialog  -->
            <v-dialog v-model="dialogCreate" max-width="900px">
                <v-card>
                    <v-navigation-drawer permanent
                    width="900" class="pa-4">
                    <v-system-bar style="text: center">  Create Medication</v-system-bar>
                    
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
                                v-model.number="create.observations"
                                
                                label="Observations"
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
                        @click="postMedication()">
                       Add Medication
                    </v-btn>
                            
                    
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <div class="text-center">
                <v-btn
                
                color="primary"
                dark
                
                @click="dialogCreate = !dialogCreate"
                >Add new Medication
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

        
  
        data () {
            return {
                medications: [],
                medication: null,
                search: '',
                show: false,
                headers: [
                    {
                        text: 'Medication',
                        align: 'center',
                        sortable: false,
                        value: 'description',
                    },       
                    { text: 'Observations', value: 'observations', align: 'center' },                                       
                    { text: 'Edit', value: 'edit', align: 'center'}
                ],
               
                mode: null,
                create: {
                    "description": null,
                    "observations": null,                    
                },

                dialogCreate: false
                

                
            }
        },
    
        methods: {

            getMedications () {
                axios.get('http://localhost:3000/medications').then((response) => {
                    this.medications = response.data.data 
                })
            },  
           

            openMaintenaceModal (row, mode) {
                // user que estas a editar
                debugger
                this.medication = row
                this.mode= mode
                this.show = true
            },

            async saveMedication (medication, mode) {
                
                this.show = false
                if (mode == 'check') {
                    return
                }

                
                
                let medicationUpdate = {
                    "description": medication.description,
                    "observations": medication.observations
                }
                

                await axios.put(`http://localhost:3000/medications/${medication.id}`, medicationUpdate).then((response) => {
                    console.log(response);
                    alert('correu bem')
                    console.log('Que Fking animal Beast')
                })
                .catch((error) => {
                    console.log(error);
                    console.log('deuBosta')
                });
                
                this.getMedications()
                        
            },


            postMedication() {
                
                
                let medicationCreate = {
                    "description": this.create.description,
                    "observations": this.create.observations
                }

                axios.post(`http://localhost:3000/medications`, medicationCreate).then((response) => {
                    console.log(response);
                    alert('correu bem')
                    console.log('Que Fking animal Beast')
                })
                .catch((error) => {
                    console.log(error);
                    console.log('deuBosta')
                });
                
                this.getMedications()
                this.dialogCreate = false
            }
                
        },

        

        created() {
            this.getMedications()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

