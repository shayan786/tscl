Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'

  get '/clubs-and-grounds'   											=>  'application#clubs_grounds'

  get '/game-zone/fixtures'   										=>  'application#fixtures'
  get '/game-zone/fixtures/:year/:over_format'   	=>  'application#fixtures'
  get '/game-zone/points-table'   								=>  'application#points_table'
  get '/game-zone/points-table/:year/:over_format' =>  'application#points_table'
  get '/game-zone/approved-umpires'   						=>  'application#approved_umpires'

  get '/operations/constitution'                  =>  'application#constitution'
  get '/operations/by-laws'                       =>  'application#by_laws'
  get '/operations/playing-conditions'            =>  'application#playing_conditions'
  get '/operations/laws-of-cricket'               =>  'application#laws_of_cricket'

  get '/game/confirm/captain'											=> 	'game#confirm_game_list'
  get '/game/confirm/captain/:id'									=> 	'game#confirm_captain'
  post '/game/confirm/new'                        =>  'game#confirm_captain_new'

  get '/game/confirm/umpire'											=>  'game#confirm_umpire_list'
  get '/game/confirm/umpire/:id'									=> 	'game#confirm_umpire'
  post '/game/confirm/umpire/new'                 =>  'game#confirm_umpire_new'

  get '/game/umpire-evaluations'                  =>  'game#umpire_evaluations_list'
  get '/game/umpire-evaluations/captain'          =>  'game#umpire_evaluations_captain_list'
  get '/game/umpire-evaluations/form/:id'         =>  'game#umpire_evaluations_form'
  post 'game/umpire-evaluations/new'              =>  'game#umpire_evaluations_new'
  get '/game/umpire-evaluations/:id'              =>  'game#umpire_evaluation'

  get '/game/match-reports'                       =>  'game#match_reports_list'
  get '/game/match-reports/captain'               =>  'game#match_reports_captain_list'
  get '/game/match-reports/form/:id'              =>  'game#match_reports_form'
  post 'game/match-reports/new'                   =>  'game#match_reports_new'
  get '/game/match-reports/:id'                   =>  'game#match_report'

  get '/game/:id'                                 =>  'game#view'
end
