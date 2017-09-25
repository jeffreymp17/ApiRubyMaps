module Api
	module V1
		class LocationsController < ApplicationController
         def index
         	locations=Location.all
         	render json:{status:'SUCEESS' ,message:'loaded locations' ,data:locations },status: :ok
        
           end
             def show
         	locations=Location.find(params[:id])
         	render json:{status:'SUCEESS' ,message:'locations found' ,data:locations },status: :ok
        
           end
           def create
            location=Location.new(locations_params)
           	if location.save
           		render json:{status:'SUCEESS' ,message:'Saved locations' ,data:location },status: :ok
              else
              render json:{status:'ERROR' ,message:'Not Saved locations',data:location.errors },status: :unprocesable_entity
             end
           end
          
           def locations_params
           params.permit(:high ,:down, :address)
          
           end
          def destroy
             	location=Location.find(params[:id])
             	location.destroy
             render json:{status:'SUCEESS' ,message:'deleted location' ,data:location },status: :ok

             end
              def last_search
         	locations=Location.last(1)
         	render json:{status:'SUCEESS' ,message:'loaded locations' ,data:locations },status: :ok
        
           end
           def name_locations
           	location=Location.select(:address,:id)
           	         	render json:{status:'SUCEESS' ,message:'loaded location names' ,data:location },status: :ok

           end
             def update
             	location=Location.find(params[:id])
               if location.update_attributes(locations_params)
               render json:{status:'SUCEESS' ,message:'loaded locations' ,data:location },status: :ok
                     else
	              render json:{status:'ERROR' ,message:'Not updated locations',data:location.errors },status: :unprocesable_entity
               	end	
             end
		end
	end
end
