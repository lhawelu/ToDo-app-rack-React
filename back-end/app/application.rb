require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/test/) 

      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "response success"}.to_json ]]

    elsif req.path.match(/tasks/) && req.get?

      return [200, { 'Content-Type' => 'application/json' }, [ Task.all.map {|m| { "id": m.id, "text": m.text, "category": m.category.name }}.to_json ]]
    
    elsif req.path.match(/tasks/) && req.post?
      data = JSON.parse req.body.read
      task = Task.create(text: data["text"], category_id: Category.find_by(name: data["category"]).id)
      res_task = {text: task.text, category: task.category.name}
      return [200, {"Content-Type" => "application/json"}, [res_task.to_json]]
    
    elsif req.path.match(/tasks/) && req.delete?
     task_id = req.path.split("/").last
     Task.find(task_id).destroy
      
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
