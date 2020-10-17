using Plots
gr()
theme(:vibrant)
function diffeq(y₀,yₚ,a₁,t)
    t_loop = range(1,t,step = 1)
    Z = zeros(t)
    l = ones(t) .*yₚ
    #plot(t_loop,ones(t)*yₚ)
    for i in t_loop
        Z[i] = yₚ + (y₀ - yₚ)*a₁^i
    end 

    anim = @animate for i ∈ 1:t
        plot(t_loop[1:i], [Z[1:i] , l[1:i]],
         ylims = (minimum(Z)-10,maximum(Z)+10),
         label = ["general solution" "particular solution"]
         )
    end
    gif(anim,"$(pwd())/diffeq.gif",fps = 30)

    #plot!(Z,xlims = (0,t+1),ylims = (minimum(Z)-10,maximum(Z)+10))
end


