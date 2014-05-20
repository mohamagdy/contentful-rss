# Creating a testing user
User.where(
  access_token: 'adcfeddf444d3b7b2b7e1e2ad81a3780c5b856740dcd4c67ef94ac20ef59739d',
  space: 'kut0k9dneylb'
).first_or_create