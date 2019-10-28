#userモデル

  class User < ApplicationRecord
  end

#userスキーマ


  |data-type|column|
  |:--|--
  |string |name|
  |string |email|
  |string |password_digest|



#taskモデル
  class Task < ApplicationRecord
  end

#taskスキーマ

  |data-type|column|
  |:--|--
  |string |name|
  |text |content|


  rails assets:precompile RAILS_ENV=production
  git add -A
  git commit -m "test commit"
  git push heroku master
  heroku run rails db:migrate

@tasks = Task.where('status::text LIKE ?', "%#{params[:status_key]}%")
  <%= form_with(model: Task.new, method: get, url: tasks_path) do |f| %>
    <%= f.label :title_search, "タイトル検索"　%>
    <%= f.text_field :name, class: "form-control"　%>
    <%= f.label :status_search, "状態検索"　%>
    <%= f.select :status, Task.statuses.keys, class: "form-control", include_blanck: true, selected: ""　%>
    <%= f.hidden_field :search, value: "true"　%>
    <%= f.label :status_search, "期限順に並べる"　%>
    <%= f.radio_button :sort, "status"　%>
    <%= form.submit %>
  <% end %>
  <% @contents.each do |content| %>
   <div class="panel panel-success">
     <div class="panel-body">
      <%= link_to(content.word,"/contents/#{content.id}") %>
     </div>
     <div class="panel-footer">content_description</div>
   </div>
  <% end %>
  <%= paginate @contents %>
  <ul>
    <% @contents.each do |content| %>
      <li><%= content.word %></li>
    <% end %>
  </ul>

<%= paginate @contents %>







<%= form.select :priority, ["高","中","低"], class: 'Task' %>
