<template>

  <v-form id="app"
    ref="form"
    v-model="valid"
    lazy-validation
    style="padding: 30px;
      margin: 0 30px;
      border-top: 0px;">
    
    <!-- field name -->
    <v-text-field
      v-model="name"
      :counter="10"
      :rules="nameRules"
      label="Name"
      required>

    </v-text-field>
    
    <!-- field Gender -->
    <v-select
      v-model="select"
      :items="items"
      :rules="[v => !!v || 'Item is required']"
      label="Gender"
      required
    ></v-select>

    <!-- Date -->
    <v-text-field
      v-model="birthDate"
      :rules="birthDateRules"
      type="date"
      label="birthDate"
      required>

    </v-text-field>

    <!-- Field Address -->
    <v-text-field
      v-model="address"
      :counter="200"
      :rules="addressRules"
      label="Address"
      required>

    </v-text-field>

    <!-- zipCode field -->
    <v-text-field
      v-model.number="zipCode"
      type="number"
      :counter="10"
      :rules="zipCodeRules"
      label="zipCode">

    </v-text-field>

    <!-- Field email -->
    <v-text-field
      v-model="email"
      :rules="emailRules"
      label="E-mail"
      required>

    </v-text-field>

    <!-- mobilePhone field -->
    <v-text-field
      v-model.number="mobilePhone"
      type="number"
      :counter="9"
      :rules="mobilePhoneRules"
      label="mobilephone">

    </v-text-field>

    <!-- Phone field -->
    <v-text-field
      v-model.number="phone"
      type="number"
      :counter="9"
      :rules="phoneRules"
      label="phone">
    </v-text-field>



    
    <!-- SNS field -->
    <v-text-field
      v-model.number="sns"
      type="number"
      :counter="20"
      :rules="snsRules"
      label="sns">

    </v-text-field>

    <!-- NIF field -->
    <v-text-field
      v-model.number="nif"
      type="number"
      :counter="20"
      :rules="nifRules"
      label="nif">

    </v-text-field>

    <!-- field Insurance -->
    <v-select
      v-model="selectInsurance"
      :items="insurance"
      :rules="[v => !!v || 'Item is required']"
      label="Select Insurance"
      required
    ></v-select>

    <!-- Password and Password Conf  -->
    <v-text-field
      v-model="password"
      :counter="8"      
      type="password"
      label="password"
      required>

    </v-text-field>
    <!-- Passwordconf -->
    <v-text-field
      v-model="passwordConfirmation"
      type="password"
      :counter="8"      
      label="passwordConfirmation"
      required>

    </v-text-field>

    

    <v-checkbox
      v-model="checkbox"
      :rules="[v => !!v || 'You must agree to continue!']"
      label="All information is correct?"
      required
    ></v-checkbox>







    <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="validate"
    >
      Validate
    </v-btn>

    <v-btn
      color="error"
      class="mr-4"
      @click="reset"
    >
      Reset Form
    </v-btn>

    <v-btn
      color="warning"
      @click="resetValidation"
    >
      Reset Validation
    </v-btn>
  </v-form>
</template>

<script>
  

  export default {
    // validations: {
    //     password: {
    //         minLength: minLength(8),
    //         required: requiredIf(function () {
    //             return this.isCreateRegistration
    //         }),
    //     },

    //     passwordConfirmation: {
    //         sameAsPassword: sameAs('password'),
    //     },
    // },

    data () {
        return {

      
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      select: null,
      items: [
        'Male',
        'Female',
      ],

      selectInsurance: null,
      insurance: [
        'None',
        'Multicare',
        'Medis',
        'AdvanceCare'
      ],
      checkbox: false,
      phone: '',
      phoneRules: [
        
        v => Number.isInteger(Number(v)) || "The value must be an integer number"
      ],

      mobilePhone: '',
      mobilePhoneRules: [
        v => !!v || 'mobilePhone is required',
        v => Number.isInteger(Number(v)) || "The value must be an integer number"
      ],

      zipCode: '',
      zipCodeRules: [
        v => !!v || 'zipCode is required',
        v => Number.isInteger(Number(v)) || "The value must be an integer number"
      ],

      sns: '',
      snsRules: [
        v => !!v || 'SNS is required',
        v => Number.isInteger(Number(v)) || "The value must be an integer number"
      ],

      nif: '',
      nifRules: [
        v => !!v || 'Nif is required',
        v => Number.isInteger(Number(v)) || "The value must be an integer number"
      ],

      address: '',
      addressRules: [
        v => !!v || 'Address is required',
        v => (v && v.length <= 200) || 'Address must be less than 200 characters',
      ],
      password: '',
      passwordRules: [
         v => !!v || 'password is required',
      ],
      passwordConfirmation: '',
      passwordConfirmationRules: [
         v => !!v || 'passwordConfirmation is required',
      ],
      birthDate: '',
      birthDateRules: [
        v => !!v || 'Address is required'
      ]

    }},

    methods: {
      validate () {
        if (this.password != this.passwordConfirmation) {
          alert('Password is not a match')
          return
        }
        this.$refs.form.validate()
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
    },
  }
</script>