module API
  module V1
    class Reactions < Grape::API
      include API::V1::Defaults
      #   version 'v1', using: :path, vendor: 'eventtus'
      namespace :post do
        route_param :post_id do
          before do
            @post = Post.find(params[:post_id])
          end
          resources :reactions do
            desc 'Returns all reactions'
            get do
              @post.reactions.all
            end

            desc 'Return a specific post'
            params do
              requires :id, type: String
            end
            get ':id' do
              @post.reactions.find(params[:id])
            end

            desc 'Create a Reaction.'
            params do
              requires :reaction, type: Hash do
                requires :reaction, type: String, desc: 'Reaction Text.'
              end
            end
            post do
              authenticate!
              @post.reactions.create!(
                user_id: current_user.id,
                reaction: params[:reaction][:reaction]
              )
            end

            desc 'Update a Reaction.'
            params do
              requires :id, type: String, desc: 'Reaction ID.'
              requires :reaction, type: Hash do
                requires :reaction, type: String, desc: 'Reaction updated reaction.'
              end
            end
            put ':id' do
              authenticate!
              @post.reactions.find(params[:id]).update(
                user_id: current_user.id,
                reaction: params[:reaction][:reaction]
              )
            end

            desc 'Delete a Reaction.'
            params do
              requires :id, type: String, desc: 'Reaction ID.'
            end
            delete ':id' do
              authenticate!
              @post.reactions.find(params[:id]).destroy
            end
          end
        end
      end
    end
end
end
