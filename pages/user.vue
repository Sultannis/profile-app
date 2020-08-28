<template>
  <div class="container">
      <h1>User information</h1>
      <div class="wrapper">
          <v-img max-width="200px" :src="user.data[0].avatar" aspect-ratio="1"></v-img>
          <div class="data">
            <h2 class="name">{{user.data[0].first_name}} {{user.data[0].last_name}}</h2>
            <h2 class="email">{{user.data[0].email}}</h2>
          </div>
      </div>
  </div>
</template>

<script>
export default {
  data() {
      return {
        users: []
      }
  },
  async mounted() {
    this.users = await this.$axios.$get('https://reqres.in/api/users?page=2/');
    console.log(this.users)
  }
}
</script>

<style lang="scss" scoped>
  .container {
    width: 50%;
  }

  .wrapper {
    display: flex;
    margin-top: 30px;
  }

  .data {
    margin-left: 30px;
  }
</style>