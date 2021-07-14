<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
     
      <v-system-bar> 
        
         <span > Create Clinical Process </span>   
      </v-system-bar>
      <v-divider></v-divider>
      <v-form>
        <v-container>
          <v-row>
            <v-col cols="12" sm="12">
              <v-textarea
                    name="input-7-1"
                    filled
                    label="Last Clinical observations"
                    auto-grow
                    v-model="clinicalProcess.observations"
              ></v-textarea>
            </v-col>

            <v-col cols="12" sm="12">
              <v-file-input
                        accept="image/*"
                        label="Patient Files"
              ></v-file-input>
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