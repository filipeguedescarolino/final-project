<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
     
      <v-system-bar> 
        <span v-if="mode == 'edit'"> Update this Medication </span>
         <span v-else> Medication Details </span>   
      </v-system-bar>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="medicationProxy">
          <v-row>
            <v-col cols="12" sm="12">
              <v-text-field
                v-model="medicationProxy.description"
                
                :readonly= "!editMode"
                label="Description"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="12">
              <v-text-field
                v-model="medicationProxy.observations"
                :readonly= "!editMode"
                label="Observations"
                outlined
                shaped
              ></v-text-field>
            </v-col>


            
            <v-col cols="12" sm="3"
              v-if="editMode">
             <v-btn
                depressed
                color="primary"
                @click="save()">
                Update
              </v-btn> 
            </v-col>
            

          </v-row>
        </v-container>
      </v-form>


     
    </v-navigation-drawer>
    <v-card-actions>
      <v-btn color="primary"  @click="save()">Close</v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
</template>

<script>
import _ from 'lodash'
export default {
    props: {
      value: Boolean,
      mode: String,
      medication: Object

  },

    data() {
      return {
        medicationProxy: null
      }
    },


    computed: {
       show() {
        return this.value
      },

      editMode () {
        return this.mode === 'edit'
      },



      
    },

    methods: {
      save () {
        debugger
        this.$emit('save', this.medicationProxy, this.mode)
      }
    },

  
    


    created() {
      this.medicationProxy = _.cloneDeep(this.medication)
    }
  }
</script>