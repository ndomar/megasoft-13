require 'test_helper'

class TaskResultsControllerTest < ActionController::TestCase
  setup do
    @task_result = task_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_result" do
    assert_difference('TaskResult.count') do
      post :create, :task_result => { :Reviewer => @task_result.Reviewer, :clicks => @task_result.clicks, :success => @task_result.success, :time => @task_result.time }
    end

    assert_redirected_to task_result_path(assigns(:task_result))
  end

  test "should show task_result" do
    get :show, :id => @task_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_result
    assert_response :success
  end

  test "should update task_result" do
    put :update, :id => @task_result, :task_result => { :Reviewer => @task_result.Reviewer, :clicks => @task_result.clicks, :success => @task_result.success, :time => @task_result.time }
    assert_redirected_to task_result_path(assigns(:task_result))
  end

  test "should destroy task_result" do
    assert_difference('TaskResult.count', -1) do
      delete :destroy, :id => @task_result
    end

    assert_redirected_to task_results_path
  end
end
