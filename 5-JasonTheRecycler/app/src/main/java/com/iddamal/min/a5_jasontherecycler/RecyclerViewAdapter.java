package com.iddamal.min.a5_jasontherecycler;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

public class RecyclerViewAdapter extends RecyclerView.Adapter<RecyclerViewAdapter.UserViewHolder> {

    // Variables -- model
    private List<User> mUserList;

    public RecyclerViewAdapter(List<User> userList) {
        mUserList = userList;
    }

    @Override
    public UserViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.recycler_view_layout, parent, false);
        UserViewHolder userViewHolder = new UserViewHolder(view);
        return userViewHolder;
    }

    @Override
    public void onBindViewHolder(UserViewHolder holder, int position) {
        holder.mUserTextView.
                setText(mUserList.get(position).getUserName() + " -- " + mUserList.get(position).getUserId());
        holder.mTitleTextView.setText(mUserList.get(position).getTitle());
        holder.mBodyTextView.setText(mUserList.get(position).getBody());

    }

    @Override
    public int getItemCount() {
        if (mUserList != null) {
            return mUserList.size();
        }
        return 0;
    }

    @Override
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
    }

    public static class UserViewHolder extends RecyclerView.ViewHolder {
        // Variables -- view
        private RecyclerView mRecyclerView;
        private TextView mUserTextView;
        private TextView mTitleTextView;
        private TextView mBodyTextView;

        public UserViewHolder(View itemView) {
            super(itemView);

            mRecyclerView = (RecyclerView) itemView.findViewById(R.id.recycler_view);
            mUserTextView = (TextView) itemView.findViewById(R.id.txtUser);
            mTitleTextView = (TextView) itemView.findViewById(R.id.txtTitle);
            mBodyTextView = (TextView) itemView.findViewById(R.id.txtBody);
        }
    }
}
