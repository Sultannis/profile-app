<template>
  <div class="container">
    <h1>Login to your account</h1>
    <form>
      <v-text-field
        v-model="login"
        :error-messages="loginErrors"
        :counter="10"
        label="Login"
        required
        @input="$v.login.$touch()"
        @blur="$v.login.$touch()"
      ></v-text-field>
      <v-text-field
        v-model="password"
        :error-messages="passwordErrors"
        label="Password"
        required
        @input="$v.password.$touch()"
        @blur="$v.password.$touch()"
      ></v-text-field>

      <n-link style="text-decoration: none;" to="/user"><v-btn class="mr-4" @click="submit">submit</v-btn></n-link>
      <v-btn @click="clear">clear</v-btn>
    </form>
  </div>
</template>

<script>
  import { validationMixin } from 'vuelidate'
  import { required, maxLength, password } from 'vuelidate/lib/validators'

  export default {
    mixins: [validationMixin],

    validations: {
      login: { required, maxLength: maxLength(10) },
      password: { required }
    },

    data: () => ({
      login: '',
      password: '',
    }),

    computed: {
      loginErrors () {
        const errors = []
        if (!this.$v.password.$dirty) return errors
        !this.$v.login.required && errors.push('Login is required.')
        return errors
      },
      passwordErrors () {
        const errors = []
        if (!this.$v.password.$dirty) return errors
        !this.$v.password.required && errors.push('Password is required')
        return errors
      },
    },

    methods: {
      submit () {
        this.$v.$touch()
      },
      clear () {
        this.$v.$reset()
        this.login = ''
        this.password = ''
      },
    },
  }
</script>

<style lang="scss" scoped>
.container {
  width: 50%;
}
</style>
