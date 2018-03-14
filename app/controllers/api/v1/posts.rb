module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      #   version 'v1', using: :path, vendor: 'eventtus'

      resources :posts do
        desc 'Returns all posts'
        get do
          Post.all.ordered
        end

        desc 'Return a specific post'
        params do
          requires :id, type: String
        end
        get ':id' do
          Post.find(params[:id])
        end

        desc 'Create a Post.'
        params do
          requires :post, type: Hash do
            requires :text, type: String, desc: 'Post Text.'
            requires :type, type: String, desc: 'Post Type.'
            
          end
        end
        post do
          authenticate!
          Post.create!(
            user_id: current_user.id,
            text: params[:post][:text],
            type: params[:post][:type],
          )
        end

        desc 'Update a Post.'
        params do
          requires :id, type: String, desc: 'Post ID.'
          requires :post, type: Hash do
            requires :text, type: String, desc: 'Post updated text.'
          end
        end
        put ':id' do
          authenticate!
          current_user.posts.find(params[:id]).update(
            user_id: current_user.id,
            text: params[:post][:text]
          )
        end

        desc 'Delete a Post.'
        params do
          requires :id, type: String, desc: 'Post ID.'
        end
        delete ':id' do
          authenticate!
          current_user.posts.find(params[:id]).destroy
        end
      end
    end
  end
end
