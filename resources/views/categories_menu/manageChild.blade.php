<ul class="drop-mega">
    @foreach($childs as $child)
        <li>
            <a href="{{ url('categories-menu/'.trim($child->slug)) }}">{{ $child->name }}</a>
        	@if(count($child->childs))
                @include('categories_menu.manageChild',['childs' => $child->childs])
            @endif
        </li>
    @endforeach
</ul>