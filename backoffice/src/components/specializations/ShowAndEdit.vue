<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
     
      <v-system-bar> 
        <span v-if="mode == 'edit'"> Update this Specialization </span>
         <span v-else> Specialization Details </span>   
      </v-system-bar>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="specializationProxy">
          <v-row>
            <v-col cols="12" sm="12">
              <v-text-field
                v-model="specializationProxy.description"
                
                :readonly= "!editMode"
                label="Description"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="12">
              <v-text-field
                v-model="specializationProxy.base_price"
                :readonly= "!editMode"
                label="Base_price"
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
      specialization: Object

  },

    data() {
      return {
        specializationProxy: null
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
        
        this.$emit('save', this.specializationProxy, this.mode)
      }
    },

  
    


    created() {
      this.specializationProxy = _.cloneDeep(this.specialization)
    }
  }
</script>