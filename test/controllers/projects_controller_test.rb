require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { approval_date: @project.approval_date, approved: @project.approved, approved_by: @project.approved_by, description: @project.description, finish_date: @project.finish_date, foundation_date: @project.foundation_date, founded: @project.founded, money_goal: @project.money_goal, rating: @project.rating } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { approval_date: @project.approval_date, approved: @project.approved, approved_by: @project.approved_by, description: @project.description, finish_date: @project.finish_date, foundation_date: @project.foundation_date, founded: @project.founded, money_goal: @project.money_goal, rating: @project.rating } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
