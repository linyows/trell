module Trell
  class Client
    module Organizations
      def create_organization(name, options = {})
        post "organizations/#{name}", options
      end
      alias_method :create_org, :create_organization

      def organization(name, options = {})
        get "organizations/#{name}", options
      end
      alias_method :org, :organization

      def update_organization(name, options = {})
        put "organizations/#{name}", options
      end
      alias_method :update_org, :update_organization

      def delete_organization(name, options = {})
        delete "organizations/#{name}", options
      end
      alias_method :delete_org, :delete_organization
    end
  end
end
