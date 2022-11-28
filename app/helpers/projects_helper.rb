module ProjectsHelper
  def project_due_date project
    if project.due_date.present?
      Time.now > project.due_date ? "Project overdue by #{ time_ago_in_words(project.due_date) }" : "Due in #{ time_ago_in_words(project.due_date) } from now"
    else
      "No due date set for this project"
    end
  end
end
