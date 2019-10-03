class Api::BenchesController < ApplicationController

    def index
        @benches = Bench.all
    end

    def create
        @bench = Bench.new(bench_params)

        if @bench.save
            render "api/benches/:id"
        else
            render json: ["THIS BENCH CANNOT COMPUTE"]
        end

    end

    def bench_params
        params.require(:bench).permit(:description, :lat, :lng)
    end
end
