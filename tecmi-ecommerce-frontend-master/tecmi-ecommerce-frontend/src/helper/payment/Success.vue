<template>
  <div class="text-center">
    <div v-if="isLoading" class="spinner-border" role="status">
      <span class="sr-only">Loading...</span>
    </div>
    <div v-else>
      <h3>Payment Successful!</h3>
      <p>Your order has been placed successfully. You will be redirected shortly.</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PaymentSuccess',
  props: ["baseURL"],
  data() {
    return {
      token: null,
      sessionId: null,
      isLoading: true // This controls the loading spinner
    };
  },
  methods: {
    async saveOrder() {
      try {
        const response = await axios.post(`${this.baseURL}order/add`, {
          token: this.token,
          sessionId: this.sessionId
        });
        // Successfully saved order
        this.isLoading = false; // Hide the spinner after the request is successful
        // Optionally, show a success message before redirect
        setTimeout(() => {
          window.location.href = '/order'; // Redirect to the orders page
        }, 2000); // Redirect after 2 seconds
      } catch (error) {
        console.error('Error saving order:', error);
        this.isLoading = false; // Hide spinner on error
        // Optionally, you can show an error message
        alert('There was an error while saving your order.');
      }
    }
  },
  mounted() {
    this.token = localStorage.getItem("token");
    this.sessionId = localStorage.getItem("sessionId");
    if (this.token && this.sessionId) {
      this.saveOrder();
    } else {
      this.isLoading = false;
      alert('Missing session or token information.');
    }
  }
}
</script>

<style scoped>
/* Add custom styles if needed */
</style>
