<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
     
      <v-system-bar> 
        <span v-if="mode == 'edit'"> Update this Insurance </span>
         <span v-else> Insurance Details </span>   
      </v-system-bar>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="insuranceProxy">
          <v-row>
            <v-col cols="12" sm="12">
              <v-text-field
                v-model="insuranceProxy.description"
                
                :readonly= "!editMode"
                label="Description"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="12">
              <v-text-field
                v-model.number="insuranceProxy.reimbursed_value"
                :readonly= "!editMode"
                label="Value to be reimbursed"
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
      insurance: Object

  },

    data() {
      return {
        insuranceProxy: null
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
        
        this.$emit('save', this.insuranceProxy, this.mode)
      }
    },

  
    


    created() {
      this.insuranceProxy = _.cloneDeep(this.insurance)
    }
  }
</script>