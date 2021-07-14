<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
      <v-system-bar></v-system-bar>
      <v-list>
        <v-list-item v-if="prescriptionProxy">
          <v-list-item-avatar height="100" width="100">
            <v-img :src= prescriptionProxy.image_src></v-img>
          </v-list-item-avatar>
        </v-list-item>

        <v-list-item v-if="prescriptionProxy">
          <v-row>
            <v-col cols="12" sm="10">
              <v-list-item-content>
                <v-list-item-title class="text-h6">
                  {{prescriptionProxy.name}}
                </v-list-item-title>
                <v-list-item-subtitle>{{prescriptionProxy.email}}</v-list-item-subtitle>
              </v-list-item-content>
            </v-col>
            
          </v-row>          
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="prescriptionProxy">
          <v-row>
            <v-col cols="12" sm="6" v-if="editMode">
              <v-text-field
                v-model="prescriptionProxy.name"
                
                :readonly= "!editMode"
                label="Name"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6" v-if="editMode">
              <v-text-field
                v-model="prescriptionProxy.email"
                :readonly= "!editMode"
                label="Email"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.gender"
                :readonly= "!editMode"
                label="Gender"
                outlined
                shaped
              >
              </v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.birthdate "
                :readonly= "!editMode"
                label="Birthdate"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.address"
                :readonly= "!editMode"
                label="Address"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.zip_code"
                :readonly= "!editMode"
                label="Zip-Code"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.mobile_phone"
                :readonly= "!editMode"
                label="Mobile Phone"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.nif"
                :readonly= "!editMode"
                label="Nif"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.certificate_number"
                :readonly= "!editMode"
                label="Certificate Number"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="prescriptionProxy.status"
                :readonly= "!editMode"
                label="Status"
                outlined
                shaped
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="12">
              <v-text-field
                v-model="prescriptionProxy.image_src"
                :readonly= "!editMode"
                label="Image Src"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="5">
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
      prescription: Object

  },

    data() {
      return {
        prescriptionProxy: null
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
        
        this.$emit('save', this.prescriptionProxy, this.mode)
      }
    },

  
    


    created() {
      this.prescriptionProxy = _.cloneDeep(this.prescription)
    }
  }
</script>