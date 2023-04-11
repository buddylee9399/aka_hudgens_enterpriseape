module ApplicationHelper

  def menu_items
    [{
      name: 'Home',
      path: root_path,
    }, {
      name: 'About',
      path: about_path,
    }, {
      name: 'Contact',
      path: contact_path,
    }, {
      name: 'Privacy',
      path: privacy_path,
    },].map do |item|
      {
        name: item[:name],
        path: item[:path],
        active: current_page?(item[:path])
      }
    end
  end

  def dropdown_items
    [{
      name: 'Company',
      path: companies_path,
    }, {
      name: 'Employee',
      path: employees_path,
    }, {
      name: 'Invoice',
      path: invoices_path,
    }, {
      name: 'Purchase',
      path: "#",
    },].map do |item|
      {
        name: item[:name],
        path: item[:path],
        active: current_page?(item[:path])
      }
    end
  end
end
