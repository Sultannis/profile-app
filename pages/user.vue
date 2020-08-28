<template>
  <div class="container">
      <h1>User information</h1>
      <div class="wrapper" v-if="users.length">
          <v-img max-width="200px" :src="users[4].avatar" aspect-ratio="1"></v-img>
          <div class="data">
            <h2 class="name">{{users[4].first_name}} {{users[4].last_name}}</h2>
            <h2 class="email">{{users[4].email}}</h2>
          </div>
      </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    users: []
  }),
  mounted() {
  this.$axios.$get('https://reqres.in/api/users?page=2/')
    .then((res) => {
      this.users = res.data})
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