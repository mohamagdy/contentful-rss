# Contentful Sync API RSS Feed

## Run

```rb
  bundle
  rake db:migrate
  rake db:seed

  rails s

  # Point to a web browser localhost:3000?user_id=1
```

## Testing
```rb
  rspec
```

## Branches
There is a branch named `oauth` with an attempt to login to Contentful through this app
using oAuth2 authentication. The work isn't complete due to time conistraints.