Rails.application.routes.draw do
  # this one is redundant - we have multiple questions index routes
  # resource is creating the questions index for us.
  # get 'questions/index'


  root 'questions#index'

  resources :questions do
    member do
      put 'upvote'
      put 'downvote'
    end
    resources :answers do
      member do
        put 'upvote'
        put 'downvote'
      end
    end
  end
  #get '/questions/:id/votes' => question#votes
end

