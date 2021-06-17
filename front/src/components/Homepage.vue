<template>
 <div>
    <button type="button" class="btn btn-primary">PatientsList</button>
    <button type="button" class="btn btn-danger">DoctorsList</button>
    <button type="button" class="btn btn-primary">AppointmentsList</button>

    <form>
    <v-text-field
      v-model="name"
      :error-messages="nameErrors"
      :counter="10"
      label="Name"
      required
      @input="$v.name.$touch()"
      @blur="$v.name.$touch()"
    ></v-text-field>
    <v-text-field
      v-model="email"
      :error-messages="emailErrors"
      label="E-mail"
      required
      @input="$v.email.$touch()"
      @blur="$v.email.$touch()"
    ></v-text-field>
    <v-select
      v-model="select"
      :items="items"
      :error-messages="selectErrors"
      label="Item"
      required
      @change="$v.select.$touch()"
      @blur="$v.select.$touch()"
    ></v-select>
    <v-checkbox
      v-model="checkbox"
      :error-messages="checkboxErrors"
      label="Do you agree?"
      required
      @change="$v.checkbox.$touch()"
      @blur="$v.checkbox.$touch()"
    ></v-checkbox>

    <v-btn
      class="mr-4"
      @click="submit"
    >
      submit
    </v-btn>
    <v-btn @click="clear">
      clear
    </v-btn>
  </form>
    

    <!-- FORM TO POST INTO PATIENTS -->
    <div class="container d-flex flex-column justify-content-center align-items-center">
                
        <div>
            <label for="patient-name">Name</label>
            <div>
                <input
                    v-model="patient.name"
                    type="text"
                    required
                    id="patient-name"
                    name="patient-name"
                    placeholder="Name" />
            </div>
            

        </div>

        <div style="margin-bottom: 10px">
            <label for="patient-insurance-confirmation">Do you have insurance?</label>
            
            
                <input
                    v-model="insurance"
                    type="checkbox"
                    id="patient-insurance-confirmation"
                    name="patient-insurance-confirmation"
                    value="yes">

                    <label for="specialization5" style=" color: black;margin-left: 5px;">Yes</label>
            
            

        </div>

        <div v-if="insurance">
            <label for="patient-insurance">Insurance</label>
            <div>
                <input
                    v-model="patient.insurance"
                    type="text"
                    required
                    id="patient-insurance"
                    name="patient-insurance"
                    placeholder="Type your insurance" />
            </div>
            

        </div>

        <div>
            <label for="patient-gender">Gender</label>
            
            <div>
                <input
                    v-model="patient.gender"
                    type="text"
                    required
                    id="patient-gender"
                    name="patient-gender"
                    placeholder="gender" />
            </div>
            

        </div>

            
        <div>
            <label for="patient-email">Endereço de e-mail</label>
            <div>
                <input
                    v-model="patient.email"
                    type="email"
                    required
                    id="patient-email"
                    name="patient-email"
                    placeholder="Endereço de E-mail" />
            </div>
        </div>

            
        <div>
            <label for="patient-dateOfBirth">Date of Birth</label>
            <div>
                <input
                    style="width: 220px"
                    v-model="patient.date_of_birth"
                    type="date"
                    required
                    id="patient-dateOfBirth"
                    name="patient-dateOfBirth"
                    placeholder="yyyy/mm/dd" />
            </div>
        </div>

        <div>
            <label for="patient-address">Address</label>
            <div>
                <input
                    v-model="patient.address"
                    type="text"
                    required
                    id="patient-address"
                    name="patient-address"
                    placeholder="Type your address" />
            </div>
        </div>

        <div>
            <label for="patient-zipCode">Zip-Code</label>
            <div>
                <input
                    v-model="patient.zip_code"
                    type="text"
                    required
                    id="patient-zipCode"
                    name="patient-zipCode"
                    placeholder="Type your zipCode" />
            </div>
        </div>

        <div>
            <label for="patient-cellPhone">Cell Phone</label>
            <div>
                <input
                    v-model="patient.cell_phone"
                    type="number"
                    required
                    id="patient-cellPhone"
                    name="patient-cellPhone"
                    placeholder="cellPhone" />
            </div>
        </div>

        <div>
            <label for="patient-Phone">Phone</label>
            <div>
                <input
                    v-model="patient.phone"
                    type="number"
                    id="patient-Phone"
                    name="patient-Phone"
                    placeholder="Phone" />
            </div>
        </div>

        <div>
            <label for="patient-SNS">Social network service</label>
            <div>
                <input
                    v-model="patient.sns"
                    type="number"
                    id="patient-SNS"
                    name="patient-SNS"
                    placeholder="SNS" />
            </div>
        </div>

        <div>
            <label for="patient-NIF">Tax Identification Number</label>
            <div>
                <input
                    v-model="patient.nif"
                    type="number"
                    id="patient-NIF"
                    name="patient-NIF"
                    placeholder="NIF" />
            </div>
        </div>

        <div>
            <label for="patient-password">Password</label>
            <div>
                <input
                    v-model="patient.password"
                    type="password"
                    id="patient-password"
                    name="patient-password"
                    placeholder="password" />
            </div>
        </div>

        <div>
            <label for="patient-password-confirmation">Password Confirmation</label>
            <div>
                <input
                    type="password"
                    id="patient-password-confirmation"
                    name="patient-password-confirmation"
                    placeholder="password-confirmation" />
            </div>
        </div>       
    </div>


    <!-- Form to Post into Doctors -->
    <div class="container d-flex flex-column justify-content-center align-items-center">
                
        <div>
            <label for="name">Name</label>
            <div>
                <input
                    v-model="doctors.name"
                    type="text"
                    required
                    id="name"
                    name="name"
                    placeholder="Name" />
            </div>
            

        </div>

        <div class="formControlGroup" style="margin-bottom: 10px; margin-top: 5px;">

            <div class="specialization">
                <p style="font-weight: bold; color: blue; font-size: 16px">Specializations</p>

                <div class="controlCheck">
                    <input
                    v-model="specialization5"
                    type="checkbox"
                    id="specialization5"
                    name="specialization5"
                    value="pediatria">

                    <label for="specialization5" style=" color: black;margin-left: 5px;">Pediatria</label>


                    <input
                    v-model="specialization1"
                    type="checkbox"
                    id="specialization5"
                    name="specialization5"
                    value="dermatologia" />

                    <label for="specialization5" style=" color: black;margin-left: 5px;">Dermatologia</label>

                    

                    <input
                    v-model="specialization2"
                    type="checkbox"
                    id="specialization2"
                    name="specialization2"
                    value="neurocirurgia">

                    <label for="specialization2" style=" color: black;margin-left: 5px;">Neurocirurgia</label>

                    

                    <input
                    v-model="specialization3"
                    type="checkbox"
                    id="specialization3"
                    name="specialization3"
                    value="oncologia">

                    <label for="specialization3" style=" color: black;margin-left: 5px;">Oncologia</label>

                    

                    <input
                    v-model="specialization4"
                    type="checkbox"
                    id="specialization4"
                    name="specialization4"
                    value="fisioterapia">

                    <label for="specialization4"  style=" color: black; margin-left: 5px;">Fisioterapia</label>
                </div>
            </div>
        </div>

        <div>
            <label for="gender">Gender</label>
            
            <div>
                <input
                    v-model="doctors.gender"
                    type="text"
                    required
                    id="gender"
                    name="gender"
                    placeholder="gender" />
            </div>
            

        </div>

            
        <div>
            <label for="email">Endereço de e-mail</label>
            <div>
                <input
                    v-model="doctors.email"
                    type="email"
                    required
                    id="email"
                    name="email"
                    placeholder="Endereço de E-mail" />
            </div>
        </div>

            
        <div>
            <label for="dateOfBirth">Date of Birth</label>
            <div>
                <input
                    style="width: 220px"
                    v-model="doctors.date_of_birth"
                    type="date"
                    required
                    id="dateOfBirth"
                    name="dateOfBirth"
                    placeholder="yyyy/mm/dd" />
            </div>
        </div>

        <div>
            <label for="address">Address</label>
            <div>
                <input
                    v-model="doctors.address"
                    type="text"
                    required
                    id="address"
                    name="address"
                    placeholder="Type your address" />
            </div>
        </div>

        <div>
            <label for="zipCode">Zip-Code</label>
            <div>
                <input
                    v-model="doctors.zip_code"
                    type="text"
                    required
                    id="zipCode"
                    name="zipCode"
                    placeholder="Type your zipCode" />
            </div>
        </div>

        <div>
            <label for="cellPhone">Cell Phone</label>
            <div>
                <input
                    v-model="doctors.cell_phone"
                    type="number"
                    required
                    id="cellPhone"
                    name="cellPhone"
                    placeholder="cellPhone" />
            </div>
        </div>

        <div>
            <label for="Phone">Phone</label>
            <div>
                <input
                    v-model="doctors.phone"
                    type="number"
                    id="Phone"
                    name="Phone"
                    placeholder="Phone" />
            </div>
        </div>

        <div>
            <label for="SNS">Social network service</label>
            <div>
                <input
                    v-model="doctors.sns"
                    type="number"
                    id="SNS"
                    name="SNS"
                    placeholder="SNS" />
            </div>
        </div>

        <div>
            <label for="NIF">Tax Identification Number</label>
            <div>
                <input
                    v-model="doctors.nif"
                    type="number"
                    id="NIF"
                    name="NIF"
                    placeholder="NIF" />
            </div>
        </div>

        <div>
            <label for="password">Password</label>
            <div>
                <input
                    v-model="doctors.password"
                    type="password"
                    id="password"
                    name="password"
                    placeholder="password" />
            </div>
        </div>

        <div>
            <label for="password">Password Confirmation</label>
            <div>
                <input
                    type="password"
                    id="password-confirmation"
                    name="password-confirmation"
                    placeholder="password-confirmation" />
            </div>
        </div>       
    </div>


   

  </div>
</template>

<script>
export default {
    data () {
        return {
            patient: {
                "qualifications": "",
                "patient_id": 4,
                "name": "Joao",
                "date_of_birth": "1990-07-31T23:00:00.000Z",
                "address": "Rua Marte",
                "zip_code": "4450",
                "email": "antonio@gmail.com",
                "cell_phone": "919191915",
                "phone": null,
                "sns": "25252525",
                "nif": "30303030",
                "password": "12345678",
                "status": "active",
                "gender": "male",
                "created_at": "2021-06-17T09:38:27.000Z",
                "updated_at": "2021-06-17T09:38:27.000Z"
            },

            doctors: {
                "certificate_number": 2530,
                "name": "Joao",
                "specialization_id": 1,
                "date_of_birth": "1990-08-01",
                "address": "Rua Marte",
                "zip_code": "4450",
                "email": "antonio@gmail.com",
                "cell_phone": "919191915",
                "password": "12345678",
                "status": "active",
                "gender": "male",
                "insurance": ""
            },

            specialization1: "",
            specialization2: "",
            specialization3: "",
            specialization4: "",
            specialization5: "",
            insurance:""
            

        }
    },
}
</script>

<style>

    .container {
        border: 1px solid red;
        background-color: rgba(255, 251, 0, 0.281);
    }



    option,
    select,
    input[type=email],
    input[type=number],
    input[type=password],
    input[type=text],    
    input[type=date],
    input[type=submit]
    {
        text-align: left;
        width: 100%;
        padding: 4px 10px;
        border: 1px solid black;
        border: 5px solid #54b3d0;
        
        line-height: 1;
        margin-top: 3px;
        margin-bottom: 12px;
    }

    label {
        font-weight: bold;
        color: blue
    }

    input[type=checkbox]{
        margin-left: 10px;
        margin-top: 12px;
    }

    
</style>