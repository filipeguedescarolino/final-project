<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
     
      <v-system-bar> 
        <span v-if="mode == 'edit'"> Update this Office </span>
         <span v-else> Office Details </span>   
      </v-system-bar>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="officeProxy">
          <v-row>
            <v-col cols="12" sm="12">
              <v-text-field
                v-model="officeProxy.description"
                
                :readonly= "!editMode"
                label="Description"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="12">
              <v-text-field
                v-model.number="officeProxy.max_capacity"
                :readonly= "!editMode"
                label="Max capacity"
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
      office: Object

  },

    data() {
      return {
        officeProxy: null
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
        
        this.$emit('save', this.officeProxy, this.mode)
      }
    },

  
    


    created() {
      this.officeProxy = _.cloneDeep(this.office)
    }
  }
</script>