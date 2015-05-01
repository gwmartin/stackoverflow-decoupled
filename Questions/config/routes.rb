Rails.application.routes.draw do
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
