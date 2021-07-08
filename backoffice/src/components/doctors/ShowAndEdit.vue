<template>
<v-dialog v-model="show" max-width="900px">
  <v-card>
    <v-navigation-drawer permanent
      width="900" class="pa-4">
      <v-system-bar></v-system-bar>
      <v-list>
        <v-list-item v-if="userProxy">
          <v-list-item-avatar height="100" width="100">
            <v-img :src= userProxy.image_src></v-img>
          </v-list-item-avatar>
        </v-list-item>

        <v-list-item v-if="userProxy">
          <v-row>
            <v-col cols="12" sm="10">
              <v-list-item-content>
                <v-list-item-title class="text-h6">
                  {{userProxy.name}}
                </v-list-item-title>
                <v-list-item-subtitle>{{userProxy.email}}</v-list-item-subtitle>
              </v-list-item-content>
            </v-col>
            
          </v-row>          
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="userProxy">
          <v-row>
            <v-col cols="12" sm="6" v-if="editMode">
              <v-text-field
                v-model="userProxy.name"
                
                :readonly= "!editMode"
                label="Name"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6" v-if="editMode">
              <v-text-field
                v-model="userProxy.email"
                :readonly= "!editMode"
                label="Email"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.gender"
                :readonly= "!editMode"
                label="Gender"
                outlined
                shaped
              >
              </v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.birthdate "
                :readonly= "!editMode"
                label="Birthdate"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.address"
                :readonly= "!editMode"
                label="Address"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.zip_code"
                :readonly= "!editMode"
                label="Zip-Code"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.mobile_phone"
                :readonly= "!editMode"
                label="Mobile Phone"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.nif"
                :readonly= "!editMode"
                label="Nif"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.certificate_number"
                :readonly= "!editMode"
                label="Certificate Number"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="userProxy.status"
                :readonly= "!editMode"
                label="Status"
                outlined
                shaped
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="12">
              <v-text-field
                v-model="userProxy.image_src"
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
      user: Object

  },

    data() {
      return {
        userProxy: null
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
        
        this.$emit('save', this.userProxy, this.mode)
      }
    },

  
    


    created() {
      this.userProxy = _.cloneDeep(this.user)
    }
  }
</script>