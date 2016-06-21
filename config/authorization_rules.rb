authorization do
  role :guest do
    # add permissions for guests here, e.g.
    # has_permission_on :conferences, :to => :read
  end

  role :enduser do
    has_permission_on :bars, to: :rest
    has_permission_on :specials, to: :rest
  end
  
  # permissions on other roles, such as
  # role :admin do
  #   has_permission_on :conferences, :to => :manage
  # end
  # role :user do
  #   has_permission_on :conferences, :to => [:read, :create]
  #   has_permission_on :conferences, :to => [:update, :delete] do
  #     if_attribute :user_id => is {user.id}
  #   end
  # end
  # See the readme or GitHub for more examples
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy

   privilege :rest do
     includes :index, :show, :new, :create, :edit, :update, :destroy, :delete
   end
   privilege :rest_without_index do
     includes :show, :new, :create, :edit, :update, :destroy, :delete
   end
   privilege :rest_without_destroy do
     includes :index, :show, :new, :create, :edit, :update
   end
end
