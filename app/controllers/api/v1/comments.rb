module API
  module V1
    class Comments < Grape::API
      include API::V1::Defaults
      #   version 'v1', using: :path, vendor: 'eventtus'
      namespace :post do
        route_param :post_id do
          before do
            @post = Post.find(params[:post_id])
          end
          resources :comments do
            desc 'Returns all comments'
            get do
              @post.comments.all
            end

            desc 'Return a specific post comment'
            params do
              requires :id, type: String
            end
            get ':id' do
              @post.comments.find(params[:id])
            end

            desc 'Create a Reaction.'
            params do
              requires :comment, type: Hash do
                requires :comment, type: String, desc: 'Reaction Text.'
              end
            end
            post do
              authenticate!
              @post.comments.create!(
                user_id: current_user.id,
                comment: params[:comment][:comment]
              )
            end

            desc 'Update a Reaction.'
            params do
              requires :id, type: String, desc: 'Reaction ID.'
              requires :comment, type: Hash do
                requires :comment, type: String, desc: 'Reaction updated comment.'
              end
            end
            put ':id' do
              authenticate!
              @post.comments.find(params[:id]).update(
                user_id: current_user.id,
                comment: params[:comment][:comment]
              )
            end

            desc 'Delete a Reaction.'
            params do
              requires :id, type: String, desc: 'Reaction ID.'
            end
            delete ':id' do
              authenticate!
              @post.comments.find(params[:id]).destroy
            end
          end
        end
      end
    end
end
end
